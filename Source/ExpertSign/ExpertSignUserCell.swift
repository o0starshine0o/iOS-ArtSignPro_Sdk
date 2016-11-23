//
//  ExpertSignTableViewCell.swift
//  ArtSignPro
//
//  Created by Star on 15/11/21.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import Kingfisher

protocol ExpertSignListUserCellDelegate : NSObjectProtocol {
    func onVideoClick(userSign:ExpertSignListUserSigns?)
    func onImitateClick(userSign:ExpertSignListUserSigns?)
}

class ExpertSignUserCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var deadlineView: UILabel!
    @IBOutlet weak var rightView: UILabel!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var imitateButton: UIButton!
    
    var delegate:ExpertSignListUserCellDelegate?
    var userSign:ExpertSignListUserSigns?
    
    func initCell(delegate:ExpertSignListUserCellDelegate?, userSign:ExpertSignListUserSigns?, index:Int) {
        self.delegate = delegate
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
            format.dateFormat = "deadline_format".localized
            deadlineView.text = String(format: "complete before %@".localized, format.string(from: Date(timeIntervalSince1970: deadlineStamp)))
        }
        if (userSign?.imageUrl?.isEmpty)! {
            imitateButton.backgroundColor = UIColor.lightGray
            imitateButton.setTitle("Designing···".localized, for: UIControlState())
            imitateButton.isEnabled = false
        }else{
            imitateButton.backgroundColor = BaseGreen
            imitateButton.setTitle("Imitate".localized, for: UIControlState())
            imitateButton.isEnabled = true
        }
        if (userSign?.videoUrl?.isEmpty)! {
            videoButton.backgroundColor = UIColor.lightGray
            videoButton.setTitle("Designing···".localized, for: UIControlState())
            videoButton.isEnabled = false
        }else{
            videoButton.backgroundColor = BaseBule
            videoButton.setTitle("Watch".localized, for: UIControlState())
            videoButton.isEnabled = true
        }
    }
    
    @IBAction func onVideoClick(_ sender:UIButton){
        delegate?.onVideoClick(userSign: userSign)
    }
    
    @IBAction func onImitateClick(_ sender:UIButton){
        delegate?.onImitateClick(userSign: userSign)
    }
}
