//
//  ExpertSignTableViewCell.swift
//  ArtSignPro
//
//  Created by Star on 15/11/21.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import Kingfisher

class ExpertSignUserCell: UICollectionViewCell {
    
    @IBOutlet var imagePreview: UIImageView!
    @IBOutlet var nameView: UILabel!
    @IBOutlet weak var deadlineView: UILabel!
    @IBOutlet var rightView: UILabel!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var imitateButton: UIButton!
    
    var userSign:ExpertSignListUserSigns?
    
    func initCell(userSign:ExpertSignListUserSigns?, index:Int) {
        self.userSign = userSign
        imagePreview.kf.setImage(with: URL(string:(userSign?.imageUrl)!), placeholder: DefaultImage)
        nameView.text = userSign?.expertSignSignName
        rightView.text = userSign?.signUserName
        videoButton.tag = index
        imitateButton.tag = index
        if (userSign?.signStatus)! != OnDesign || (userSign?.deadlineTimeStamp)! == 0 {
            deadlineView.text = ""
        }else{
            let deadlineStamp = TimeInterval((userSign?.deadlineTimeStamp)!)
            let format = DateFormatter()
            format.dateFormat = "MM月dd日HH:mm"
            deadlineView.text = "\(format.string(from: Date(timeIntervalSince1970: deadlineStamp)))前完成"
        }
        if (userSign?.imageUrl?.isEmpty)! {
            imitateButton.backgroundColor = UIColor.lightGray
            imitateButton.setTitle("设计中···", for: UIControlState())
            imitateButton.isEnabled = false
        }else{
            imitateButton.backgroundColor = BaseGreen
            imitateButton.setTitle("开始临摹", for: UIControlState())
            imitateButton.isEnabled = true
        }
        if (userSign?.videoUrl?.isEmpty)! {
            videoButton.backgroundColor = UIColor.lightGray
            videoButton.isEnabled = false
        }else{
            videoButton.backgroundColor = BaseBule
            videoButton.isEnabled = true
        }
    }
}
