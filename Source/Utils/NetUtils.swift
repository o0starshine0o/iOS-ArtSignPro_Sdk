//
//  NetUtils.swift
//  ArtSignPro
//
//  Created by Star on 15/11/21.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import CryptoSwift

let Success = "0"

let LocalUrl = "http://192.168.1.115:10000/"
let TestDomain = "http://sign.test.qima.tech/"
let TestPreviewDomain = "http://sign.preview.test.qima.tech/"
let ProductionDomain = "http://sign.qima.tech/"
let ProductionPreviewDomain = "http://sign.preview.qima.tech/"

var Url:String{
    switch Environment{
    case .Test:
        return TestDomain
    case .Production:
        return ProductionDomain
    }
}

let VerifyUrl = "\(Url)comm/send_verify_code/"
let LoginUrl = "\(Url)comm/login/"

let FontListUrl = "\(Url)font/get_font_list/"
let SignListUrl = "\(Url)sign/sign_list/"
let SignDetailUrl = "\(Url)sign/expert_sign_details/"
let CustomSignIntroductionUrl = "\(Url)customized_sign/get_introductions/"
let CustomSignListUrl = "\(Url)customized_sign/get_customized_sign_list/"
let CustomSignDetailUrl = "\(Url)customized_sign/get_customized_sign_detail/"
let CustomSignSuggestionUrl = "\(Url)customized_sign/add_modify_suggestion/"
let CustomSignRecordUrl = "\(Url)customized_sign/add_script_record/"
let CustomSignOptionsUrl = "\(Url)customized_sign/get_options/"
let CustomSignPriceUrl = "\(Url)customized_sign/get_price/"
let CustomSignChargeUrl = "\(Url)customized_sign/create_charge/"
let CustomSignUpdateChargeUrl = "\(Url)customized_sign/update_charge_status/"

let GetChargeUrl = "\(Url)pay/create_charge/"
let GetChargeIDUrl = "\(Url)pay/create_ios_charge/"
let CheckReceiptUrl = "\(Url)pay/check_ios_receipt/"
let PayMethodUrl = "\(Url)business/get_pay_method/"
let GetPriceUrl = "\(Url)pay/get_price/"

class NetUtils{
    
    class func getBaseParams() -> Dictionary<String, String>{
        // get base info
        let infoDictionary = Bundle.main.infoDictionary
        let majorVersion = infoDictionary!["CFBundleShortVersionString"]
        let appDisplayVersion = majorVersion as! String
        let version = appDisplayVersion
        let identify = infoDictionary!["CFBundleIdentifier"] as! String
        let iosVersion = UIDevice.current.systemVersion
        let model = UIDevice.deviceModelReadable()
        let time  =  String(Int64(Date().timeIntervalSince1970 * 1000))
        let user = DataUtils.getUserInfo()
        let password = user.id + BusinessSecret + time
        let signature = password.md5()
        // create params
        var params = Dictionary<String, String>()
        params["business_key"] = BusinessKey
        params["platform"] = "iOS"
        params["app_version"] = version.replacingOccurrences(of: ".", with: "")
        params["production_version"] = version
        params["phone_model"] = model
        params["phone_version"] = iosVersion
        params["timestamp"] = time
        params["user_id"] = user.id
        params["signature"] = signature
        params["market"] = "AppStore"
        params["identify"] = identify
        return params
    }
    
    class func refreshBaseParams(params:inout Dictionary<String, String>){
        let time  =  String(Int64(Date().timeIntervalSince1970 * 1000))
        let user = DataUtils.getUserInfo()
        let password = user.id + BusinessSecret + time
        let signature = password.md5()
        params["timestamp"] = time
        params["user_id"] = user.id
        params["signature"] = signature
    }
}
