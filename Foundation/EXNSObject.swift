//
//  EXNSObject.swift
//  ReuseCode
//
//  Created by huanghe on 7/12/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}


///// 安全添加和移除观察者
//extension NSObject {
//    
//    private struct associatedKeys {
//        static var safe_observersArray = "observers"
//    }
//    
//    
//    private var observers: [[String : NSObject]] {
//        get {
//            if let observers = objc_getAssociatedObject(self, &associatedKeys.safe_observersArray) as? [[String : NSObject]] {
//                return observers
//            } else {
//                self.observers = [[String : NSObject]]()
//                return self.observers
//            }
//        } set {
//            objc_setAssociatedObject(self, &associatedKeys.safe_observersArray, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//    
//    
//    public func safe_addObserver(observer: NSObject, forKeyPath keyPath: String) {
//        let observerInfo = [keyPath : observer]
//        
//        if observers.indexOf({ $0 == observerInfo }) == nil {
//            observers.append(observerInfo)
//            addObserver(observer, forKeyPath: keyPath, options: [.Old, .New], context: nil)
//        }
//    }
//    
//    public func safe_removeObserver(observer: NSObject, forKeyPath keyPath: String) {
//        let observerInfo = [keyPath : observer]
//        if let index = observers.indexOf({ $0 == observerInfo}) {
//            observers.removeAtIndex(index)
//            removeObserver(observer, forKeyPath: keyPath)
//        }
//    }
//    
//}
