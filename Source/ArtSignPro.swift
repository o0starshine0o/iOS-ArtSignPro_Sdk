//
//  ArtSignPro.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/19.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit
import Foundation

public enum EnvironmentType{
    case Test
    case Production
}

let DefaultImage = UIImage.init(named: "Loading")

var BusinessKey:String = ""
var BusinessSecret:String = ""
var BusinessScheme:String = ""
var Environment:EnvironmentType = .Test
var EnableLog:Bool = false

public func initArtSignPro(key:String, secret:String, scheme:String){
    BusinessKey = key
    BusinessSecret = secret
    BusinessScheme = scheme
}

public func setEnvironment(environment:EnvironmentType){
    Environment = environment
}

open class ArtSignProDelegate: UIResponder, UIApplicationDelegate {
    
    public func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool{
        return Pingpp.handleOpen(url, withCompletion: nil)
    }
    
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return Pingpp.handleOpen(url as URL!, withCompletion: nil)
    }
    
}
