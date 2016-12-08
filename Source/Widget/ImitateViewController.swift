//
//  ImitateViewController.swift
//  ArtSignPro
//
//  Created by Star on 15/11/8.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import Kingfisher

class ImitateViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var signImageView: BrushBoard!
    
    var imageUrl:String?
    var backViewControllerID:String?
    var orientation:Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orientation = UIDevice.current.value(forKey: "orientation")
        // 强制横屏
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        // 下载图片
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool){
        // 友盟统计
//        MobClick.beginLogPageView("临摹")
        // 隐藏导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 友盟统计
//        MobClick.endLogPageView("临摹")
        // 显示导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.landscape
    }
    
    @IBAction func onExit(_ sender: UIButton) {
        // 退回之前的状态
        UIDevice.current.setValue(orientation, forKey: "orientation")
        if self.backViewControllerID != nil{
            self.performSegue(withIdentifier: self.backViewControllerID!, sender: self)
        }
    }
    
    func loadData(){
        backgroundImageView.kf.setImage(with: URL.init(string: imageUrl!), placeholder: DefaultImage)
    }
}
