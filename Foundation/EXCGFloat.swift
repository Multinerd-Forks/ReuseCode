//
//  CGFloatExtensions.swift
//  ReuseCode
//
//  Created by huanghe on 7/12/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    public var center: CGFloat { return (self / 2) }
    
    
    public func toRadians() -> CGFloat {
        return (CGFloat (M_PI) * self) / 180.0
    }
    
    
    public func degreesToRadians() -> CGFloat {
        return toRadians()
    }
    
    
    public mutating func toRadiansInPlace() {
        self = (CGFloat (M_PI) * self) / 180.0
    }
    
    
    public func degreesToRadians (_ angle: CGFloat) -> CGFloat {
        return (CGFloat (M_PI) * angle) / 180.0
    }
}
