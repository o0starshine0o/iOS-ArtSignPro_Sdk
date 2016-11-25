//
//  PayViewController.swift
//  ArtSignPro
//
//  Created by Star on 15/12/2.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import StoreKit
import Alamofire
import SwiftSpinner
import Toast_Swift

class PayBaseController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    // 用于验证iap是否到账
    fileprivate var chargeID:Int = 0
    // 记录用于创建charge的参数，满足从其他ViewController返回时调用
    fileprivate var chargeSymbol:String?
    fileprivate var chargeParams:Dictionary<String, String>?
    fileprivate var chargeUrl:String?
    fileprivate var chargeProductID:String?
    fileprivate var chargeUpdateProductStatusUrl:String?
    // 支付成功后跳转
    var successControllerID:String?
    
    override func viewWillAppear(_ animated: Bool){
        // 添加支付状态监听
        SKPaymentQueue.default().add(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 移除支付状态监听
        SKPaymentQueue.default().remove(self)
    }
    
    // 返回到本viewController
    @IBAction func toPayBaseController(segue: UIStoryboardSegue) {
        if segue.identifier != nil {
            switch segue.identifier! {
            case "PayBaseController":
                NetUtils.refreshBaseParams(params: &chargeParams!)
                // 从登录界面返回，直接调起支付
                onPay(chargeSymbol!, params: chargeParams!, url: chargeUrl!, productID: chargeProductID!, updateStatusUrl: chargeUpdateProductStatusUrl!)
            default:
                break
            }
        }
    }
    
    // 开始支付
    func onPay(_ symbol:String, params:Dictionary<String, String>, url:String, productID:String, updateStatusUrl:String) {
        // 记录用于创建charge的参数，满足从其他ViewController返回时调用
        chargeSymbol = symbol
        chargeParams = params
        chargeUrl = url
        chargeProductID = productID
        chargeUpdateProductStatusUrl = updateStatusUrl
        // 判断用户是否登录
        if DataUtils.isLogin(){
            // 根据不同的支付方式走不同的流程
            if symbol == "iap" {
                // 走应用内支付
                getChargeID(params: params, productID: productID, url:url)
            }else{
                // 走ping++
                getCharge(params: params, url:url)
            }
        }else{
            // 跳转到登录界面
            performSegue(withIdentifier: "ShowLogin", sender: self)
        }
    }
    
    // Step 1 : 获取订单ID
    func getChargeID(params:Dictionary<String, String>, productID:String, url:String){
        SwiftSpinner.show("获取订单ID...")
        Alamofire.request(url, method: .post, parameters: params).responseJSON{response in
            switch response.result{
            case .success(let value):
                let response = PayResponse.init(object: value as AnyObject)
                if response.status?.code == Success{
                    // 请求成功.获取ChargeID，继续支付进程
                    self.chargeID = (response.result?.chargeId)!
                    self.getProducts(productID)
                }else{
                    // 请求失败,结束支付
                    self.payFailed("\((response.status?.descriptionValue)!)\n")
                    SwiftSpinner.hide()
                }
            case .failure(let error):
                self.payFailed("亲，检查下网络再试下，么么哒^_^\n")
                SwiftSpinner.hide()
                print(error)
            }
        }
    }
    
    // Step 2 : 获取所有产品
    func getProducts(_ productID:String){
        if(SKPaymentQueue.canMakePayments()) {
            // 如果可以使用应用内支付，开始应用内支付流程
            SwiftSpinner.show("正在获取产品列表...")
            let productIDs = Set([productID])
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productIDs)
            request.delegate = self
            request.start()
        } else {
            // 如果没有开启应用内支付，引导用户开启应用内支付
            let alert = UIAlertController(title: "应用内支付未开启", message: "请再设置界面开启应用内支付", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "设置", style: UIAlertActionStyle.default, handler: { alertAction in
                alert.dismiss(animated: true, completion: nil)
                
                let url: URL? = URL(string: UIApplicationOpenSettingsURLString)
                if url != nil
                {
                    UIApplication.shared.openURL(url!)
                }
                
            }))
            alert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.default, handler: { alertAction in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            SwiftSpinner.hide()
        }
    }
    
    // Step 3 : 获取到所有产品，使用IAP付款
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let products = response.products
        var product:SKProduct?
        
        for tempProduct in products {
            product = tempProduct
        }
        if product != nil {
            SwiftSpinner.show("付款...")
            // 使用IAP
            payByIAP(product!)
        }else{
            payFailed("亲，产品信息目前缺货请换款产品，么么哒^_^\n")
            SwiftSpinner.hide()
        }
    }
    
    // Step 4 : 使用IAP付款
    func payByIAP(_ product:SKProduct){
        let pay = SKPayment(product: product)
        SKPaymentQueue.default().add(pay)
    }
    
    // Step 5 : 完成支付,验证支付是否成功
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            switch trans.transactionState {
            case .purchased:
                // 完成购买,验证支付是否成功
                validatingReceipts()
                queue.finishTransaction(trans)
            case .failed:
                payFailed("亲，检查下网络再试下，么么哒^_^\n")
                SwiftSpinner.hide()
                queue.finishTransaction(trans)
            case .restored:
                payFailed("亲，不要重复下单哦^_^\n")
                SwiftSpinner.hide()
                queue.finishTransaction(trans)
            default:
                print("default")
            }
        }
    }
    
    // Step 6 : 验证支付是否完成,如果完成，改变订单状态为完成
    func validatingReceipts(){
        SwiftSpinner.show("服务器认证中...")
        let receiptUrl = Bundle.main.appStoreReceiptURL
        let receipt = try? Data(contentsOf: receiptUrl!)
        let receiptData = receipt!.base64EncodedString(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
        var params = NetUtils.getBaseParams()
        params["receipt"] =  receiptData
        params["charge_id"] = String(chargeID)
        Alamofire.request(self.chargeUpdateProductStatusUrl!, method: .post, parameters: params).responseJSON{response in
            switch response.result{
            case .success(let value):
                let response = Response.init(object: value as AnyObject)
                if response.status?.code == Success{
                    // 请求成功.获取ChargeID，继续支付进程
                    self.paySuccess()
                }else{
                    self.payFailed("")
                }
            case .failure:
                self.payFailed("")
            }
        }
    }
    
    // Step 1 : 获取ping++的charge
    func getCharge(params:Dictionary<String, String>?, url:String){
        // 获取charge对象
        Alamofire.request(url, method:.post, parameters: params).responseJSON{response in
            switch response.result{
            case .success(let value):
                let respoonse = PayResponse.init(object: value as AnyObject)
                if Int((respoonse.status?.code)!)! == 0{
                    // 请求成功
                    self.payByPingPP(charge: respoonse.result?.charge)
                }else{
                    // 请求失败
                    self.payFailed("\((respoonse.status?.descriptionValue)!)\n")
                }
            case .failure:
                self.payFailed("")
            }
        }
    }
    
    // Step 2 : 等待ping++的结果
    func payByPingPP(charge:Any!){
        Pingpp.createPayment(charge as! NSObject!, appURLScheme: BusinessScheme, withCompletion: {result -> Void in
            if "success".contains(result.0!){
                self.paySuccess()
            }else{
                self.payFailed("")
            }
        })
    }
    
    // 支付成功
    func paySuccess() {
        SwiftSpinner.hide()
        view.makeToast("亲，下单成功了^_^\n请耐心等待我们设计师为您设计")
        if self.successControllerID != nil{
            self.performSegue(withIdentifier: self.successControllerID!, sender: self)
        }
    }
    
    // 支付失败
    func payFailed(_ reason:String) {
        SwiftSpinner.hide()
        AlertUtils.showAlert(viewController: self, title: "支付失败", message: "\(reason)亲，支付木有完成T_T\n请联系我们客服QQ：2639880990")
    }
}
