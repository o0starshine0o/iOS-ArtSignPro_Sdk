//
//  SignDetailViewController.swift
//  ArtSignPro
//
//  Created by Star on 15/12/1.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import Alamofire

class ExpertSignDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var expertId:String?
    var productId:String?
    var expertSignDetailResponse:ExpertSignDetailResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool){
        // 显示导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // 友盟统计
//        MobClick.beginLogPageView("签名详情")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        MobClick.endLogPageView("签名详情")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "ShowExpertSignPay":
            let viewController = segue.destination as! ExpertSignPayViewController
            viewController.expertId = expertId!
            viewController.productId = productId!
        case "ShowVideo":
            let viewController = segue.destination as! VideoViewController
            viewController.videoUrl = expertSignDetailResponse?.result?.videoUrl
        default:
            break
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        if expertSignDetailResponse == nil{
            return 0
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section{
        case 0:
            return 1
        case 1:
            return (expertSignDetailResponse?.result?.detailsDesignImage?.count)!
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        switch section{
        case 0:
            return "示例教程："
        case 1:
            return "产品展示："
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        switch (indexPath as NSIndexPath).section{
        case 0:
            return 260
        case 1:
            let image = expertSignDetailResponse?.result?.detailsDesignImage?[(indexPath as NSIndexPath).row]
            let height = CGFloat((image?.height)! * Int(tableView.frame.width) / (image?.width)!)
            return height
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch (indexPath as NSIndexPath).section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! ExpertSignImageCell
            cell.initCell()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ExpertSignImageCell
            let image = expertSignDetailResponse?.result?.detailsDesignImage?[(indexPath as NSIndexPath).row]
            cell.initCell(imageUrl: image?.url)
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "cellImage")!
        }
    }
    
    // 下载用户的专家签数据
    func loadData(){
        var params = NetUtils.getBaseParams()
        params["expert_sign_id"] = expertId!
        Alamofire.request(SignDetailUrl, method: .post, parameters: params).responseJSON(completionHandler:expertSignDetailResponseHandler)
    }
    // 获取专家签数据列表回调
    func expertSignDetailResponseHandler(response: DataResponse<Any>) -> Void {
        switch response.result {
        case .success(let value):
            expertSignDetailResponse = ExpertSignDetailResponse.init(object: value as AnyObject)
            if expertSignDetailResponse?.status?.code == Success {
                self.tableView.reloadData()
            }else{
                self.tableView.makeToast((expertSignDetailResponse?.status?.descriptionValue)!)
            }
        case .failure(let error):
            print(error)
        }
        indicator.stopAnimating()
    }
}
