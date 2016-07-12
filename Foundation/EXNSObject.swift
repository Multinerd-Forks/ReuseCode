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
        return self.dynamicType.className
    }
    
    public static var className: String {
        return String(self)
    }
}