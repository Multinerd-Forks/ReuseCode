//
//  EXUIAlertController.swift
//  ReuseCode
//
//  Created by huanghe on 10/20/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    func alert(title: String, message: String,
               cancel: String = "取消", sure: String = "确定",
               preferredStyle: UIAlertControllerStyle = .alert,
               sureAction: ((UIAlertAction) -> ())? = nil) {
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let action = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        controller.addAction(action)
        
        let sureAction = UIAlertAction(title: sure, style: .default, handler: sureAction)
        controller.addAction(sureAction)
        
        present(controller, animated: true, completion: nil)
    }
    
}
