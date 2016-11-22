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
    
    var onSuccessBackSegueID:String?
    
    let WaitingTime = 60
    var toViewController:Int!
    var phoneNum:String!
    var authCode:String!
    var timer:Timer!
    var coolDownTime:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        // 显示导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
            Alamofire.request(VerifyUrl, method: .post, parameters: params)
                .responseJSON{response in
                    switch response.result{
                    case .success(let value):
                        let response = Response.init(object: value as AnyObject)
                        if Int((response.status?.code)!) == 0{
                            // 请求成功
                            AlertUtils.showAlert(viewController: self, title: "发送成功", message: "验证码已发送至您的手机：\(self.phoneNum!)")
                        }else{
                            // 请求失败
                            AlertUtils.showAlert(viewController: self, title: "", message: (response.status?.description)!)
                        }
                        break
                    case .failure( _):
                        AlertUtils.showAlert(viewController: self, title: "发送失败", message: "请确认您的手机：\(self.phoneNum!)是否正确\n检查无误后请点击“获取验证码”")
                        break
                    }
            }
            // 启动倒计时
            coolDownTime = WaitingTime
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(LoginViewController.coolDown), userInfo: nil, repeats: true)
            getAuthCodeButton.isEnabled = false
        }else{
            // 电话号码不正确
            AlertUtils.showAlert(viewController: self, title: "号码错误", message: "请确认您的手机：\(phoneNum!)是否正确\n检查无误后请点击“获取验证码”")
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        authCode = verificationCodeView.text
        if phoneNum == nil {
            phoneNum = phoneNumView.text
        }
        if !DataUtils.isTelNumber(num: phoneNum){
            // 电话号码不正确
            AlertUtils.showAlert(viewController: self, title: "号码错误", message: "请确认您的手机：\(phoneNum!)是否正确\n检查无误后请点击“获取验证码”")
            return
        }
        if DataUtils.isAuthCode(num: authCode){
            // 验证码正确，发起登陆请求
            var params = NetUtils.getBaseParams()
            params["user_phone"] = phoneNum
            params["code"] = authCode
            params["is_rl"] = "1"
            Alamofire.request(LoginUrl, method: .post, parameters: params).responseJSON{response in
                    switch response.result{
                    case .success(let value):
                        let response = LoginResponse.init(object: value as AnyObject)
                        if Int((response.status?.code)!)! == 0{
                            // 请求成功
                            let id = response.result?.userId
                            let name = response.result?.userName
                            let phone = response.result?.userPhone
                            DataUtils.login(id:String(describing: id!), name:name!, phone:phone!)
                            if self.onSuccessBackSegueID != nil{
                                self.performSegue(withIdentifier: self.onSuccessBackSegueID!, sender: self)
                            }
                        }else{
                            // 请求失败
                            AlertUtils.showAlert(viewController: self, title: "", message: (response.status?.description)!)
                        }
                        break
                    case .failure(let error):
                        print(error)
                        break
                    }
            }
        }else{
            // 验证码错误
            AlertUtils.showAlert(viewController: self, title: "号码错误", message: "请确认验证码：\(authCode!)，是否正确\n检查无误后请点击“开始签名吧”")
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
