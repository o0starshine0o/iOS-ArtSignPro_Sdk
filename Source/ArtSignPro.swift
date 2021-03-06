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

var StartPanWidth:CGFloat = 10
var MinPanWidth:CGFloat = 2
var MaxPanWidth:CGFloat = 13

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
    
    public static var MaxPan:CGFloat = 13
    public static var MinPan:CGFloat = 2
    
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
    
    public func enableLog(enable:Bool) -> Void{
        EnableLog = enable
    }
    
    public func getVersion() -> String{
        return getSdkVersion()
    }
    
    public func setPanWidth(min:CGFloat, max:CGFloat, start:CGFloat) -> Void{
        if min <= start && start <= max {
            MinPanWidth = min
            MaxPanWidth = max
            StartPanWidth = start
        }else{
            print("PanWidth between 2 and 13")
        }
    }
    
    func showSdkResponse(reponse: DataResponse<Any>) -> Void {
        switch reponse.result {
        case .success(let value):
            let payMethod = PayMethodResponse.init(object: value as AnyObject)
            if payMethod.status?.code == Success {
                if EnableLog {
                    print("pay method type count:"+String((payMethod.result?.count)!))
                }
                delegate?.isShowSdk(show: (payMethod.result?.count)! > 0)
            }else{
                if EnableLog {
                    print((payMethod.status?.extra)!+(payMethod.status?.descriptionValue)!)
                }
                delegate?.isShowSdk(show: false)
            }
        case .failure:
            if EnableLog {
                print("Network error")
            }
            delegate?.isShowSdk(show: false)
        }
    }
}
