//
//  LoginViewController.swift
//  ArtSignPro
//
//  Created by Star on 15/9/3.
//  Copyright (c) 2015年 Star. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var phoneNumView: UITextField!
    @IBOutlet weak var verificationCodeView: UITextField!
    @IBOutlet var getAuthCodeButton: UIButton!
    
    var backViewControllerID:String?
    
    let WaitingTime = 60
    var phoneNum:String!
    var authCode:String!
    var timer:Timer!
    var coolDownTime:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        // 友盟统计
//        MobClick.beginLogPageView("登陆")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 友盟统计
//        MobClick.endLogPageView("登陆")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func getVerificationCode(_ sender: UIButton) {
        phoneNum = phoneNumView.text
        if DataUtils.isTelNumber(num: phoneNum){
            // 电话号码正确,获取验证码
            var params = NetUtils.getBaseParams()
            params["user_phone"] = phoneNum
            params["verify_type"] = "1"
            Alamofire.request(VerifyUrl, method: .post, parameters: params).responseJSON(completionHandler: getVerificationCodeResponse)
            // 启动倒计时
            coolDownTime = WaitingTime
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(LoginViewController.coolDown), userInfo: nil, repeats: true)
            getAuthCodeButton.isEnabled = false
        }else{
            AlertUtils.showAlert(viewController: self, title: "号码错误", message: "请确认您的手机：\(phoneNum!)是否正确\n检查无误后请点击“获取验证码”")
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        authCode = verificationCodeView.text
        if phoneNum == nil {
            phoneNum = phoneNumView.text
        }
        if !DataUtils.isTelNumber(num: phoneNum){
            AlertUtils.showAlert(viewController: self, title: "号码错误", message: "请确认您的手机：\(phoneNum!)是否正确\n检查无误后请点击“获取验证码”")
            return
        }
        if DataUtils.isAuthCode(num: authCode){
            var params = NetUtils.getBaseParams()
            params["user_phone"] = phoneNum
            params["code"] = authCode
            params["is_rl"] = "1"
            Alamofire.request(LoginUrl, method: .post, parameters: params).responseJSON(completionHandler: loginResponse)
        }else{
            AlertUtils.showAlert(viewController: self, title: "号码错误", message: "请确认验证码：\(authCode!)，是否正确\n检查无误后请点击“开始签名吧”")
        }
    }
    
    // the response of login
    func loginResponse(response: DataResponse<Any>) -> Void {
        switch response.result{
        case .success(let value):
            let response = LoginResponse.init(object: value as AnyObject)
            if response.status?.code == Success{
                let id = response.result?.userId
                let name = response.result?.userName
                let phone = response.result?.userPhone
                DataUtils.login(id:String(describing: id!), name:name!, phone:phone!)
                if self.backViewControllerID != nil{
                    self.performSegue(withIdentifier: self.backViewControllerID!, sender: self)
                }
            }else{
                AlertUtils.showAlert(viewController: self, title: "", message: (response.status?.description)!)
            }
            break
        case .failure(let error):
            print(error)
            break
        }
    }
    
    // the response of get verification code
    func getVerificationCodeResponse(response: DataResponse<Any>) -> Void {
        switch response.result{
        case .success(let value):
            let response = Response.init(object: value as AnyObject)
            if response.status?.code == Success{
                // 请求成功
                AlertUtils.showAlert(viewController: self, title: "发送成功", message: "验证码已发送至您的手机：\(self.phoneNum!)")
            }else{
                // 请求失败
                AlertUtils.showAlert(viewController: self, title: "", message: (response.status?.description)!)
            }
            break
        case .failure:
            AlertUtils.showAlert(viewController: self, title: "发送失败", message: "请确认您的手机：\(self.phoneNum!)是否正确\n检查无误后请点击“获取验证码”")
            break
        }
    }
    
    func coolDown(){
        coolDownTime = coolDownTime-1
        getAuthCodeButton.setTitle("重发\(coolDownTime!)s", for: UIControlState())
        if coolDownTime <= 0{
            getAuthCodeButton.setTitle("获取验证码", for: UIControlState())
            getAuthCodeButton.isEnabled = true
            timer.invalidate()
        }
    }
    
}
