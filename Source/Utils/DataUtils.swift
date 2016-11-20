//
//  DataUtils.swift
//  ArtSignPro
//
//  Created by Star on 15/9/4.
//  Copyright (c) 2015年 Star. All rights reserved.
//

import Foundation

let OnDesign = 1
let CompleteDesign = 2
let WithoutVideo = 1
let WithVideo = 2
let ChargeStatus_ToDesign = 2
let ChargeStatus_HavePushed = 3
let ChargeStatus_ToRecord = 4
let ChargeStatus_Complete = 5

// 54B0FE
let BaseBule = UIColor.init(red: 84/255, green: 176/255, blue: 254/255, alpha: 1)
// ace03c
let BaseGreen = UIColor.init(red: 172/255, green: 224/255, blue: 60/255, alpha: 1)

class DataUtils{
    
    class func login(id:String, name:String, phone:String){
        let defaults = UserDefaults.standard
        defaults.set(id, forKey: "id")
        defaults.set(name, forKey: "name")
        defaults.set(phone, forKey: "phone")
        defaults.synchronize()
    }
    
    class func getUserInfo() -> (id:String, name:String, phone:String){
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "id")
        let name = defaults.object(forKey: "name")
        let phone = defaults.object(forKey: "phone")
        let idString = id != nil ? String(describing: id!) : ""
        let nameString = name != nil ? String(describing: name!) : ""
        let phoneString = phone != nil ? String(describing: phone!) : ""
        return (idString, nameString, phoneString)
    }
    
    class func isLogin() -> Bool{
        let defaults = UserDefaults.standard
        let idTemp = defaults.object(forKey: "id")
        if idTemp == nil{
            return false
        }else{
            let id = Int(String(describing: idTemp!))
            return id! > 0;
        }
    }
    
    class func logout(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "id")
        defaults.removeObject(forKey: "name")
        defaults.removeObject(forKey: "phone")
        defaults.synchronize()
    }
    
    class func isTelNumber(num:String)->Bool{
        let mobile = "^1\\d{10}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        return regextestmobile.evaluate(with: num)
    }
    
    class func isAuthCode(num:String)->Bool{
        let authCode = "^\\d{4,8}$"
        let regextestCode = NSPredicate(format: "SELF MATCHES %@",authCode)
        return regextestCode.evaluate(with: num)
    }
    
    class func isChineseName(name:String)->Bool{
        let authCode = "^[\\u4e00-\\u9fa5]{2,7}$"
        let regextestCode = NSPredicate(format: "SELF MATCHES %@",authCode)
        return regextestCode.evaluate(with: name)
    }
}
