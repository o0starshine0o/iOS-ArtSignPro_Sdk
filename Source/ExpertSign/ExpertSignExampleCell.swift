//
//  ExpertSignTableViewCell.swift
//  ArtSignPro
//
//  Created by Star on 15/11/21.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import Kingfisher

class ExpertSignExampleCell: UICollectionViewCell {
    
    @IBOutlet var imagePreview: UIImageView!
    @IBOutlet var nameView: UILabel!
    @IBOutlet var priceView: UILabel!
    
    var expertSign:ExpertSignListExpertSigns?
    var payMethodResult:PayMethodResult?
    
    func initCell(expertSign:ExpertSignListExpertSigns?, payMethodResult:PayMethodResult?) {
        self.expertSign = expertSign
        imagePreview.kf.setImage(with: URL(string:(expertSign?.imageUrl)!), placeholder: DefaultImage)
        nameView.text = expertSign?.signName
        if payMethodResult?.symbol == "iap" {
            priceView.text = String(format: "￥%.2f", Double((expertSign?.iosPrice)!)/100.0)
        }else{
            priceView.text = String(format: "￥%.2f", Double((expertSign?.designPrice)!)/100.0)
        }
    }
}
