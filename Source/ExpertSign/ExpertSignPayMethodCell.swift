//
//  SignDetailPayMethodCell.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/6/7.
//  Copyright © 2016年 Star. All rights reserved.
//

import UIKit

class ExpertSignPayMethodCell: UITableViewCell {

    @IBOutlet weak var nameView: UILabel!
    
    func initCell(name:String?) {
        nameView.text = name
    }

}
