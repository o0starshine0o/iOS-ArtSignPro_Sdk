//
//  PayMethodTableViewCell.swift
//  ArtSignPro
//
//  Created by Star on 15/12/4.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit

class PayMethodCell: UITableViewCell {
    
    @IBOutlet var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func initCell(name:String?){
        nameLabel.text = name
    }
    
}
