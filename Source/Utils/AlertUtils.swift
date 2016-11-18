//
//  AlertUtils.swift
//  ArtSignPro
//
//  Created by Star on 15/12/4.
//  Copyright © 2015年 Star. All rights reserved.
//

import UIKit

class AlertUtils: NSObject {
    
    class func showAlert(viewController:UIViewController, title:String, message:String){
        //Create the AlertController
        let actionSheetController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Create and add the Cancel action
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {action -> Void in
            //Do some stuff
        })
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let enterAction = UIAlertAction(title: "确认", style: .default, handler: { action -> Void in
            //Do some other stuff
        })
        actionSheetController.addAction(enterAction)
        //Present the AlertController
        viewController.present(actionSheetController, animated: true, completion: nil)
    }
    
}
