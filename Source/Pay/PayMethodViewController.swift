//
//  PayMethodViewController.swift
//  ArtSignPro
//
//  Created by Star on 15/12/4.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit

class PayMethodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var methods:[PayMethodResult]?
    var selectMethod:PayMethodResult?
    
    override func viewWillAppear(_ animated: Bool){
        // 显示导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // 友盟统计
//        MobClick.beginLogPageView("支付方式")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 友盟统计
//        MobClick.endLogPageView("支付方式")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var count = 0
        if methods != nil {
            count = methods!.count
            for i in 0 ..< count {
                let method = methods![i]
                // 如果支付列表有微信而手机没装微信，将微信支付从数组中删除
                if method.symbol == "wx" && !DataUtils.schemeAvailable(scheme: "weixin://") {
                    methods?.remove(at: i)
                    break
                }
            }
            count = methods!.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MethodCell") as! PayMethodCell
        cell.initCell(name: methods?[(indexPath as NSIndexPath).row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        // 在viewcontroller返回之前记录选中的支付方式
        selectMethod = methods?[(indexPath as NSIndexPath).row]
        return indexPath
    }
}
