//
//  SignDetailPayTimeCell.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/6/7.
//  Copyright © 2016年 Star. All rights reserved.
//

import UIKit

class ExpertSignPayTimeCell: UITableViewCell {

    @IBOutlet weak var timeView: UILabel!
    
    func initCell(time:Int?) {
        let deadlineStamp = TimeInterval(time!)
        let format = DateFormatter()
        format.dateFormat = "MM月dd日HH:mm"
        timeView.text = "\(format.string(from: Date(timeIntervalSince1970: deadlineStamp)))前完成设计"
    }

}
