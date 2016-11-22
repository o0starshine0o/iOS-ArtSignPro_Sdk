//
//  ViewUtils.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/22.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}
