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

let DefaultImage = UIImage.init(named: "Loading")
var BusinessKey:String = ""
var BusinessSecret:String = ""
var BusinessScheme:String = ""
var Environment:EnvironmentType = .Test
var EnableLog:Bool = false

@objc
public enum EnvironmentType : Int{
    case Test
    case Production
}

@objc(ArtSignProSdkDelegate)
public protocol ArtSignProSdkDelegate : NSObjectProtocol {
    func isShowSdk(show:Bool)
}

@objc(ArtSignPro)
public class ArtSignPro:NSObject{
    var delegate:ArtSignProSdkDelegate?
    public init(key:String, secret:String, scheme:String) {
        BusinessKey = key
        BusinessSecret = secret
        BusinessScheme = scheme
    }
    
    public func setEnvironment(environment:EnvironmentType){
        Environment = environment
    }
    
    public func isShowSdk(delegate:ArtSignProSdkDelegate){
        self.delegate = delegate
        Alamofire.request(PayMethodUrl, method: .post, parameters: NetUtils.getBaseParams()).responseJSON(completionHandler: showSdkResponse)
    }
    
    public func handleOpen(url:URL) -> Bool {
        return Pingpp.handleOpen(url, withCompletion: nil)
    }
    
    func showSdkResponse(reponse: DataResponse<Any>) -> Void {
        switch reponse.result {
        case .success(let value):
            let payMethod = PayMethodResponse.init(object: value as AnyObject)
            if payMethod.status?.code == Success {
                delegate?.isShowSdk(show: (payMethod.result?.count)! > 0)
            }else{
                delegate?.isShowSdk(show: false)
            }
        case .failure:
            delegate?.isShowSdk(show: false)
        }
    }
}
