//
//  ExpertSignListViewController.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/15.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit
import Alamofire

class ExpertSignListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var retryView: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UICollectionView!
    
    var expertSignListResponse:ExpertSignListResponse?
    var selectUserSign:ExpertSignListUserSigns?
    var selectExpertSign:ExpertSignListExpertSigns?
    
    var payMethod:PayMethodResponse?
    var payMethodResult:PayMethodResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is ExpertSignExampleCell {
            let cell = sender as! ExpertSignExampleCell
            selectExpertSign = cell.expertSign
        }else if sender is UIButton {
            let button = sender as! UIButton
            selectUserSign = expertSignListResponse?.result?.userSigns?[button.tag]
        }
        
        switch segue.identifier! {
//        case "ShowVideo":
//            let viewController = segue.destination as! VideoViewController
//            viewController.videoUrl = selectUserSign?.videoUrl
//        case "ShowImitate":
//            let viewController = segue.destination as! ImitateViewController
//            viewController.onSegueBackID = "SignListBack"
//            viewController.imageUrl = selectUserSign?.imageUrl
        case "ShowExpertSignDetail":
            let viewController = segue.destination as! ExpertSignDetailViewController
            viewController.expertId = String((selectExpertSign?.expertSignId)!)
            viewController.productId = (selectExpertSign?.iosProductPayId)!
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if (expertSignListResponse?.result?.userSigns?.count)! > 0 {
            if indexPath.row < (expertSignListResponse?.result?.userSigns?.count)! {
                return CGSize(width: collectionView.frame.width,height: 160)
            }else if indexPath.row == (expertSignListResponse?.result?.userSigns?.count)! {
                return CGSize(width: collectionView.frame.width,height: 40)
            }else{
                return CGSize(width: collectionView.frame.width/2,height: collectionView.frame.width/2 + 50)
            }
        }else{
            return CGSize(width: collectionView.frame.width/2,height: collectionView.frame.width/2 + 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if expertSignListResponse == nil || expertSignListResponse?.result?.userSigns == nil || expertSignListResponse?.result?.expertSigns == nil {
            return 0
        }else if (expertSignListResponse?.result?.userSigns?.count)! > 0{
            return (expertSignListResponse?.result?.userSigns?.count)! + (expertSignListResponse?.result?.expertSigns?.count)! + 1
        }else{
            return (expertSignListResponse?.result?.expertSigns?.count)!
        }
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if (expertSignListResponse?.result?.userSigns?.count)! > 0 {
            if indexPath.row < (expertSignListResponse?.result?.userSigns?.count)! {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! ExpertSignUserCell
                cell.initCell(userSign: expertSignListResponse?.result?.userSigns?[indexPath.row], index:indexPath.row)
                return cell
            }else if indexPath.row == (expertSignListResponse?.result?.userSigns?.count)! {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DividerCell", for: indexPath)
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath) as! ExpertSignExampleCell
                if expertSignListResponse != nil && payMethodResult != nil {
                    let index = (indexPath as NSIndexPath).row - 1  - (expertSignListResponse?.result?.userSigns?.count)!
                    cell.initCell(expertSign: expertSignListResponse?.result?.expertSigns?[index], payMethodResult: payMethodResult)
                }
                return cell
            }
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath) as! ExpertSignExampleCell
            cell.initCell(expertSign: expertSignListResponse?.result?.expertSigns?[indexPath.row], payMethodResult: payMethodResult)
            return cell
        }
        
    }
    
    // get expert sign list
    @IBAction func loadData(_ sender: AnyObject){
        retryView.isHidden = true
        indicatorView.startAnimating()
        
        let payMethodParams = NetUtils.getBaseParams()
        Alamofire.request(PayMethodUrl, method: .post, parameters: payMethodParams).responseJSON(completionHandler: payMethodResponse)
        
        var params = NetUtils.getBaseParams()
        params["video"] = String(WithVideo)
        Alamofire.request(SignListUrl, method: .post, parameters: params).responseJSON(completionHandler:expertSignListResponse)
    }
    
    // get pay method response
    func payMethodResponse(response: DataResponse<Any>) -> Void {
        switch response.result {
        case .success(let value):
            payMethod = PayMethodResponse.init(object: value as AnyObject)
            if payMethod?.status?.code == Success {
                payMethodResult = payMethod?.result![0]
                self.tableView.reloadData()
            }else{
                self.tableView.makeToast((payMethod?.status?.descriptionValue)!)
            }
        case .failure:
            retryView.isHidden = false
        }
    }
    
    // get expert sign list response
    func expertSignListResponse(response: DataResponse<Any>) -> Void {
        switch response.result {
        case .success(let value):
            expertSignListResponse = ExpertSignListResponse.init(object: value as AnyObject)
            if expertSignListResponse?.status?.code == Success {
                self.tableView.reloadData()
            }else{
                self.tableView.makeToast((expertSignListResponse?.status?.descriptionValue)!)
            }
        case .failure:
            retryView.isHidden = false
        }
        indicatorView.stopAnimating()
    }
    
    // 支付
    func pay(_ sender: AnyObject) {
        var params = NetUtils.getBaseParams()
        params["channel"] = "wx"
        params["expert_sign_id"] = "3"
        params["sign_type"] = String(WithVideo)
        params["sign_user_name"] = "胡的胜"
        params["addition_content"] = ""
//        onPay("alipay", params: params, url: GetChargeUrl, productID: "1", updateStatusUrl: CheckReceiptUrl)
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
