//
//  ExpertSignPayViewController.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/21.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit
import Alamofire
import M13Checkbox

class ExpertSignPayViewController: PayBaseController, UITableViewDataSource, UITableViewDelegate, ExpertSignPayResultDelegate, ExpertSignPayNameDelegate, ExpertSignPayExtraDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var benefitView: UILabel!
    @IBOutlet weak var benefitViewHeight: NSLayoutConstraint!
    
    var expertId:String!
    var productId:String!
    var withVideo = true
    var name:String!
    var request:String!
    var payMethod:PayMethodResponse?
    var payMethodResult:PayMethodResult?
    var expertSignDetailResponse:ExpertSignDetailResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 支付成功跳走
        successControllerID = "ExpertSignListViewController"
        loadData()
    }
    
    // 跳转到下一个viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        switch segue.identifier! {
        case "ShowPayMethod":
            print("ShowPayMethod")
            let viewController = segue.destination as! PayMethodViewController
            viewController.backViewControllerID = "ExpertSignPayViewController"
            viewController.methods = payMethod?.result
        case "ShowLogin":
            let viewController = segue.destination as! LoginViewController
            viewController.backViewControllerID = "PayBaseController"
        default:
            break
        }
    }
    
    // return to this controller
    @IBAction func toExpertSignPay(segue: UIStoryboardSegue) {
        if segue.source is PayMethodViewController {
            payMethodResult = (segue.source as! PayMethodViewController).selectMethod
            tableView.reloadData()
            getPrice()
        }
    }
    
    @IBAction func pay(_ sender: AnyObject) {
        if name != nil && (name! =~ (expertSignDetailResponse?.result?.regular)!){
            var params = NetUtils.getBaseParams()
            params["channel"] = payMethodResult?.symbol!
            params["expert_sign_id"] = expertId
            params["sign_type"] = withVideo ? String(WithVideo) : String(WithoutVideo)
            params["sign_user_name"] = name!
            params["addition_content"] = request == nil ? "" : request!
            var url:String?
            if payMethodResult?.symbol == "iap" {
                url = GetChargeIDUrl
            }else{
                url = GetChargeUrl
            }
            onPay((payMethodResult?.symbol)!, params: params, url: url!, productID: productId, updateStatusUrl: CheckReceiptUrl)
        }else{
            AlertUtils.showAlert(viewController: self, title: "格式错误", message: "亲，填写有效的姓名哦～～～\n（英文签需要使用英文哦）")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if expertSignDetailResponse == nil {
            return 0
        }else if payMethod == nil || (payMethod?.result?.count)! < 2{
            return 2
        }else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath as NSIndexPath).section {
        case 0:
            return 160
        case 1:
            switch (indexPath as NSIndexPath).row {
            case 3:
                return 100
            default:
                return 44
            }
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath as NSIndexPath).section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell",for: indexPath) as! ExpertSignPayShowCell
            let result = expertSignDetailResponse?.result
            var price:Int?
            if payMethodResult?.symbol == "iap" {
                price = result?.iosPrice
            }else{
                price = result?.designPrice
            }
            cell.initCell(url: result?.imageUrl, name: result?.signName, introduction: result?.designerIdentity, price: price)
            return cell
        case 1:
            switch (indexPath as NSIndexPath).row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell",for: indexPath) as! ExpertSignPayResultCell
                cell.initCell(delegate: self, payMethod: payMethodResult, videoPrice: expertSignDetailResponse?.result?.videoPrice)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell",for: indexPath) as! ExpertSignPayTimeCell
                cell.initCell(time: expertSignDetailResponse?.result?.deadlineTimeStamp)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell",for: indexPath) as! ExpertSignPayNameCell
                cell.initCell(delegate: self, name: name)
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraCell",for: indexPath) as! ExpertSignPayExtraCell
                cell.initCell(delegate: self)
                return cell
            default:
                return tableView.dequeueReusableCell(withIdentifier: "ResultCell",for: indexPath)
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayMethodCell",for: indexPath) as! ExpertSignPayMethodCell
            cell.initCell(name: payMethodResult?.name)
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "ShowCell",for: indexPath)
        }
    }
    
    func onDraftCheck(_ state:M13Checkbox.CheckState){
    }
    func onVideoCheck(_ state:M13Checkbox.CheckState){
        withVideo = state == M13Checkbox.CheckState.checked
        getPrice()
    }
    func onNameChanged(name:String?){
        self.name = name
    }
    func onExtraChanged(request:String?){
        self.request = request
    }
  
    func loadData(){
        // get pay method
        let payMethodParams = NetUtils.getBaseParams()
        Alamofire.request(PayMethodUrl, method: .post, parameters: payMethodParams).responseJSON(completionHandler: payMethodResponse)
        // get sign detail
        var orderParams = NetUtils.getBaseParams()
        orderParams["expert_sign_id"] = expertId
        Alamofire.request(SignDetailUrl, method: .post, parameters: orderParams).responseJSON(completionHandler: orderInfoResponse)
    }
    
    func getPrice() {
        var params = NetUtils.getBaseParams()
        params["coupon_id"] = ""
        params["expert_sign_id"] = expertId
        params["sign_type"] = String(withVideo ? WithVideo : WithoutVideo)
        Alamofire.request(GetPriceUrl, method: .post, parameters: params).responseJSON(completionHandler: getPriceResponse)
    }
    
    // the response of sign detail
    func orderInfoResponse(response: DataResponse<Any>) -> Void {
        switch response.result{
        case .success(let value):
            expertSignDetailResponse = ExpertSignDetailResponse.init(object: value as AnyObject)
            if expertSignDetailResponse?.status?.code == Success {
                self.tableView.reloadData()
                getPrice()
            }else{
                self.tableView.makeToast((expertSignDetailResponse?.status?.descriptionValue)!)
            }
        case .failure(let error):
            print(error)
        }
    }
    
    // the response of pay method
    func payMethodResponse(response: DataResponse<Any>) -> Void {
        switch response.result {
        case .success(let value):
            payMethod = PayMethodResponse.init(object: value as AnyObject)
            if payMethod?.status?.code == Success {
                payMethodResult = payMethod?.result![0]
                self.tableView.reloadData()
                getPrice()
            }else{
                self.tableView.makeToast((payMethod?.status?.descriptionValue)!)
            }
        case .failure(let error):
            print(error)
        }
    }
    
    // the response of get price
    func getPriceResponse(response: DataResponse<Any>) -> Void {
        switch response.result {
        case .success(let value):
            let response = GetPriceResponse.init(object: value as AnyObject)
            if response.status?.code == Success {
                priceView.text = String(format: "￥%.2f", Double((response.result?.price)!)/100.0)
                benefitView.text = nil
                benefitViewHeight.constant = 0
            }else{
                self.tableView.makeToast((response.status?.descriptionValue)!)
            }
        case .failure(let error):
            print(error)
        }
    }

}
