//
//  EXButton.swift
//  ReuseCode
//
//  Created by huanghe on 10/17/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit


extension UIButton {
    /// EZSwiftExtensions
    
    // swiftlint:disable function_parameter_count
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, target: AnyObject, action: Selector) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        addTarget(target, action: action, for: UIControlEvents.touchUpInside)
    }
    // swiftlint:enable function_parameter_count
    
    /// EZSwiftExtensions
    public func setBackgroundColor(_ color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}
