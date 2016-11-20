//
//  SignDetailImageTableViewCell.swift
//  ArtSignPro
//
//  Created by Star on 15/12/1.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import Kingfisher

class ExpertSignImageCell: UITableViewCell {

    @IBOutlet var showImageView: UIImageView!
    
    func initCell(imageUrl:String!){
        showImageView.kf.setImage(with: URL(string: imageUrl), placeholder: DefaultImage)
    }
    
    func initCell() {
//        showImageView.image = 
    }

}
