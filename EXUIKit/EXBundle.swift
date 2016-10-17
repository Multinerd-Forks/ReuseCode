//
//  EXBundle.swift
//  ReuseCode
//
//  Created by huanghe on 10/17/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation


public extension Bundle {
    
    /// EZSE: load xib
    //  Usage: Set some UIView subclass as xib's owner class
    //  NSBundle.loadNib("ViewXibName", owner: self) //some UIView subclass
    //  self.addSubview(self.contentView)
    public class func loadNib(_ name: String, owner: AnyObject!) {
        _ = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?[0]
    }
    
    /// EZSE: load xib
    /// Usage: let view: ViewXibName = NSBundle.loadNib("ViewXibName")
    public class func loadNib<T>(_ name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? T
    }
    
}
