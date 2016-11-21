//
//  SignDetailPayShowCell.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/6/7.
//  Copyright © 2016年 Star. All rights reserved.
//

import UIKit
import Kingfisher

class ExpertSignPayShowCell: UITableViewCell {

    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var introductionView: UILabel!
    @IBOutlet weak var priceView: UILabel!
    
    func initCell(url:String?, name:String?, introduction:String?, price:Int?) {
        imagePreview.kf.setImage(with: URL(string: url!), placeholder: DefaultImage)
        nameView.text = name
        introductionView.text = introduction
        priceView.text = String(format: "￥%.2f", Double((price)!)/100.0)
    }

}
