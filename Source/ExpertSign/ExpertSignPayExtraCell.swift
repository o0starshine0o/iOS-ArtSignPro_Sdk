//
//  SignDetailPayRequestCell.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/6/7.
//  Copyright © 2016年 Star. All rights reserved.
//

import UIKit

public protocol ExpertSignPayExtraDelegate : NSObjectProtocol {
    func onExtraChanged(request:String?)
}

class ExpertSignPayExtraCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var requestView: UITextView!
    
    var delegate:ExpertSignPayExtraDelegate?

    func initCell(delegate:ExpertSignPayExtraDelegate?) {
        self.delegate = delegate
    }
    
    func textViewDidChange(_ textView: UITextView){
        delegate?.onExtraChanged(request: textView.text)
    }

}
