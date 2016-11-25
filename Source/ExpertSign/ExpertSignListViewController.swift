//
//  ExpertSignListViewController.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/15.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit
import Alamofire

class ExpertSignListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ExpertSignListUserCellDelegate {
    @IBOutlet weak var loginView: UIButton!
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
    
    override func viewWillAppear(_ animated: Bool) {
        // if user has logined , hidden the login button
        if DataUtils.isLogin(){
            navigationItem.rightBarButtonItem = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is ExpertSignExampleCell {
            let cell = sender as! ExpertSignExampleCell
            selectExpertSign = cell.expertSign
        }
        
        switch segue.identifier! {
        case "ShowVideo":
            let viewController = segue.destination as! VideoViewController
            viewController.videoUrl = selectUserSign?.videoUrl
        case "ShowImitate":
            let viewController = segue.destination as! ImitateViewController
            viewController.backViewControllerID = "ExpertSignListViewController"
            viewController.imageUrl = selectUserSign?.imageUrl
        case "ShowExpertSignDetail":
            let viewController = segue.destination as! ExpertSignDetailViewController
            viewController.expertId = String((selectExpertSign?.expertSignId)!)
            viewController.productId = (selectExpertSign?.iosProductPayId)!
        case "ShowLogin":
            let viewController = segue.destination as! LoginViewController
            viewController.backViewControllerID = "ExpertSignListViewController"
        default:
            break
        }
    }
    
    // return to this controller
    @IBAction func toExpertSignList(segue: UIStoryboardSegue) {
        if segue.source is LoginViewController {
            loadData(self)
        }else if segue.source is ExpertSignPayViewController{
            loadData(self)
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
                cell.initCell(delegate: self, userSign: expertSignListResponse?.result?.userSigns?[indexPath.row], index:indexPath.row)
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
    
    // ExpertSignListUserCellDelegate
    func onVideoClick(userSign:ExpertSignListUserSigns?){
        selectUserSign = userSign
    }
    // ExpertSignListUserCellDelegate
    func onImitateClick(userSign:ExpertSignListUserSigns?){
        selectUserSign = userSign
    }
}
