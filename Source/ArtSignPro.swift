//
//  ArtSignPro.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/19.
//  Copyright © 2016年 qicode. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

public enum EnvironmentType{
    case Test
    case Production
}

public protocol ArtSignProSdkDelegate : NSObjectProtocol {
    func isShowSdk(show:Bool)
}

let DefaultImage = UIImage.init(named: "Loading")
var BusinessKey:String = ""
var BusinessSecret:String = ""
var BusinessScheme:String = ""
var Environment:EnvironmentType = .Test
var EnableLog:Bool = false

open class ArtSignProDelegate: UIResponder, UIApplicationDelegate {
    
    public func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool{
        return Pingpp.handleOpen(url, withCompletion: nil)
    }
    
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return Pingpp.handleOpen(url as URL!, withCompletion: nil)
    }
    
}

public func initArtSignPro(key:String, secret:String, scheme:String){
    BusinessKey = key
    BusinessSecret = secret
    BusinessScheme = scheme
}

public func setEnvironment(environment:EnvironmentType){
    Environment = environment
}

public func isShowSdk(delegate:ArtSignProSdkDelegate){
    Alamofire.request(PayMethodUrl, method: .post, parameters: NetUtils.getBaseParams()).responseJSON{response in
        switch response.result {
        case .success(let value):
            let payMethod = PayMethodResponse.init(object: value as AnyObject)
            if payMethod.status?.code == Success {
                delegate.isShowSdk(show: (payMethod.result?.count)! > 0)
            }else{
                delegate.isShowSdk(show: false)
            }
        case .failure:
            delegate.isShowSdk(show: false)
        }
    }
}
