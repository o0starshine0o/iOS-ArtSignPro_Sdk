//
//  AppUtils.swift
//  ArtSignPro
//
//  Created by Star on 15/12/5.
//  Copyright © 2015年 Star. All rights reserved.
//

import Foundation

func getSdkVersion() -> String{
    let infoDictionary = Bundle.init(for: DataUtils.self).infoDictionary
    let majorVersion = infoDictionary!["CFBundleShortVersionString"]
    let appDisplayVersion = majorVersion as! String
    return appDisplayVersion
}
