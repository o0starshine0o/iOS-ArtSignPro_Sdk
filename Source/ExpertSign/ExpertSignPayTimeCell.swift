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
        format.dateFormat = "deadline_format".localized
        timeView.text = String(format: "complete before %@".localized, format.string(from: Date(timeIntervalSince1970: deadlineStamp)))
    }

}
