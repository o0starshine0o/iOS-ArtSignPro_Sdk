//
//  ExpertSignListViewController.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/15.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit
import Alamofire

class ExpertSignListViewController: PayBaseController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 1
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! ExpertSignListUserCell
        return cell
        
    }
    
    // 下载用户的专家签数据
    func loadData(){
        // 获取支付方式
        let payMethodParams = NetUtils.getBaseParams()
        Alamofire.request(PayMethodUrl, method: .post, parameters: payMethodParams).responseJSON(completionHandler: payMethodResponse)
        // 获取签名数据
        var params = NetUtils.getBaseParams()
        params["video"] = String(WithVideo)
        Alamofire.request(SignListUrl, method: .post, parameters: params).responseJSON(completionHandler:expertSignListResponse)
//        indicatorView.startAnimating()
    }
    
    // 获取支付方式回调
    func payMethodResponse(response: DataResponse<Any>) -> Void {
//        switch response.result {
//        case .success(let value):
//            payMethod = PayMethodResponse.init(object: value as AnyObject)
//            if payMethod?.status?.code == Success {
//                payMethodResult = payMethod?.result![0]
//                self.listView.reloadData()
//            }else{
//                self.listView.makeToast(payMethod?.status?.descriptionValue)
//            }
//        case .failure(let error):
//            print(error)
//        }
    }
    
    // 获取专家签数据列表回调
    func expertSignListResponse(response: DataResponse<Any>) -> Void {
        switch response.result {
        case .success(let value):
            let _ = ExpertSignListResponse.init(object: value as AnyObject)
//            if expertSignListResponse?.status?.code == Success {
//                self.listView.reloadData()
//            }else{
//                self.listView.makeToast(expertSignListResponse?.status?.descriptionValue)
//            }
        case .failure(let error):
            print(error)
        }
//        indicatorView.stopAnimating()
    }
    
    // 支付
    func pay(_ sender: AnyObject) {
        var params = NetUtils.getBaseParams()
        params["channel"] = "alipay"
        params["expert_sign_id"] = "3"
        params["sign_type"] = String(WithVideo)
        params["sign_user_name"] = "胡永胜"
        params["addition_content"] = ""
        onPay("alipay", params: params, url: GetChargeUrl, productID: "1", updateStatusUrl: CheckReceiptUrl)
//        if SignName != nil && (SignName! =~ (expertSignDetailResponse?.result?.regular)!){
//            var params = NetUtils.getBaseParams()
//            params["channel"] = payMethodResult?.symbol!
//            params["expert_sign_id"] = expertId
//            params["sign_type"] = withVideo ? String(WithVideo) : String(WithoutVideo)
//            params["sign_user_name"] = SignName
//            params["addition_content"] = request == nil ? "" : request!
//            var url:String?
//            if payMethodResult?.symbol == "iap" {
//                url = GetChargeIDUrl
//            }else{
//                url = GetChargeUrl
//            }
//            onPay((payMethodResult?.symbol)!, params: params, url: url!, productID: productId, updateStatusUrl: CheckReceiptUrl)
//        }else{
//            AlertUtils.showAlert(viewController: self, title: "格式错误", message: "亲，填写有效的姓名哦～～～\n（英文签需要使用英文哦）")
//        }
    }

}
