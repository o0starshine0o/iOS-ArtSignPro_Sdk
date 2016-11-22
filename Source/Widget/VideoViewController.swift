//
//  VideoVideoController.swift
//  ArtSignPro
//
//  Created by Star on 15/12/5.
//  Copyright © 2015年 Star. All rights reserved.
//

import AVKit
import AVFoundation

class VideoViewController: AVPlayerViewController {
    
    var videoUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player = AVPlayer(url: URL(string:videoUrl!)!)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        
        player.play()
    }
    
    override func viewWillAppear(_ animated: Bool){
        // 显示导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // 友盟统计
//        MobClick.beginLogPageView("视频播放")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 友盟统计
//        MobClick.endLogPageView("视频播放")
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.portrait]
    }
}
