//
//  SignDetailPayResultCell.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/6/7.
//  Copyright © 2016年 Star. All rights reserved.
//

import UIKit
import M13Checkbox

public protocol ExpertSignPayResultDelegate : NSObjectProtocol {
    func onDraftCheck(_ state:M13Checkbox.CheckState)
    func onVideoCheck(_ state:M13Checkbox.CheckState)
}

class ExpertSignPayResultCell: UITableViewCell {
    @IBOutlet weak var draftView: M13Checkbox!
    @IBOutlet weak var videoView: M13Checkbox!
    @IBOutlet weak var videoPriceView: UILabel!
    
    var delegate:ExpertSignPayResultDelegate?
    var payMethod:PayMethodResult?
    var videoPrice:Int?
    
    func initCell(delegate:ExpertSignPayResultDelegate?, payMethod:PayMethodResult?, videoPrice:Int?) {
        self.delegate = delegate
        self.payMethod = payMethod
        self.videoPrice = videoPrice
        draftView.checkState = M13Checkbox.CheckState.checked
        videoView.checkState = M13Checkbox.CheckState.checked
        if payMethod?.symbol == "iap" {
            videoPriceView.text = nil
        }else{
            videoPriceView.text = String(format: "(￥%.2f)", Double(videoPrice!)/100.0)
        }
    }

    @IBAction func draftCheck(_ sender: M13Checkbox) {
        // 默认一直选中
        draftView.toggleCheckState(true)
        delegate?.onDraftCheck(draftView.checkState)
    }
    @IBAction func videoCheck(_ sender: M13Checkbox) {
        if payMethod?.symbol == "iap" {
            videoView.toggleCheckState(true)
        }
        delegate?.onVideoCheck(videoView.checkState)
    }

}
