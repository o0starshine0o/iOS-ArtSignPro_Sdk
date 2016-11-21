//
//  SignDetailPayNameCell.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/6/7.
//  Copyright © 2016年 Star. All rights reserved.
//

import UIKit

public protocol ExpertSignPayNameDelegate : NSObjectProtocol {
    func onNameChanged(name:String?)
}

class ExpertSignPayNameCell: UITableViewCell {

    @IBOutlet weak var nameView: UITextField!
    
    var delegate:ExpertSignPayNameDelegate?
    
    func initCell(delegate:ExpertSignPayNameDelegate?, name:String? = nil) {
        self.delegate = delegate
        nameView.text = name
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        delegate?.onNameChanged(name: sender.text)
    }

}
