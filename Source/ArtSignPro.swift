//
//  ArtSignPro.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/19.
//  Copyright © 2016年 qicode. All rights reserved.
//

import Foundation

public enum EnvironmentType{
    case Test
    case Production
}

let DefaultImage = UIImage.init(named: "Loading")

var BusinessKey:String = ""
var BusinessSecret:String = ""
var Environment:EnvironmentType = .Test
var EnableLog:Bool = false

public func initArtSignPro(key:String, secret:String){
    BusinessKey = key
    BusinessSecret = secret
}

public func setEnvironment(environment:EnvironmentType){
    Environment = environment
}

public func login(){
    DataUtils.login(id:"7", name:"胡永胜", phone:"13018019891")
}

