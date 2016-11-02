//
//  EXUIViewController.swift
//  ReuseCode
//
//  Created by huanghe on 7/12/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit

// MARK: - 判断视图控制器是不是pop出去
extension UIViewController {
    
    func isPopoutWhenViewWillDisappear() -> Bool {
        if let viewControllers = navigationController?.viewControllers {
            if !(viewControllers.count > 1 && viewControllers[viewControllers.count - 2] == self) {
                return true
            }
        }
        return false
    }
}

// MARK: - 设置返回按钮
extension UIViewController {
    
    func st_setLeftNavigationItem(_ imgName: String = "back_float_normal")  {
        let backBtnItem : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(UIViewController.xyzback))
        self.navigationItem.leftBarButtonItem = backBtnItem
    }
    
    func xyzback() {
        let _ = navigationController?.popViewController(animated: true)
    }
}

// MARK: - 获取最上层视图控制器
extension UIViewController {
    // Get ViewController in top present level
    var topPresentedViewController: UIViewController? {
        var target: UIViewController? = self
        while (target?.presentedViewController != nil) {
            target = target?.presentedViewController
        }
        return target
    }
    
    // Get top VisibleViewController from ViewController stack in same present level.
    // It should be visibleViewController if self is a UINavigationController instance
    // It should be selectedViewController if self is a UITabBarController instance
    var topVisibleViewController: UIViewController? {
        if let navigation = self as? UINavigationController {
            if let visibleViewController = navigation.visibleViewController {
                return visibleViewController.topVisibleViewController
            }
        }
        if let tab = self as? UITabBarController {
            if let selectedViewController = tab.selectedViewController {
                return selectedViewController.topVisibleViewController
            }
        }
        return self
    }
    
    // Combine both topPresentedViewController and topVisibleViewController methods, to get top visible viewcontroller in top present level
    var topMostViewController: UIViewController? {
        return self.topPresentedViewController?.topVisibleViewController
    }
}
