//
//  EXNSDictionary.swift
//  ReuseCode
//
//  Created by huanghe on 7/12/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation


public extension NSDictionary {
    /// Unserialize JSON string into NSDictionary
    public convenience init ? (json: String) {
        if let data = (try? NSJSONSerialization.JSONObjectWithData(json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!, options: NSJSONReadingOptions.MutableContainers)) as? NSDictionary {
            self.init(dictionary: data)
        } else {
            self.init()
            return nil
        }
    }
    
    /// Serialize NSDictionary into JSON string
    public func formatJSON() -> String? {
        if let jsonData = try? NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions()) {
            let jsonStr = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
            return String(jsonStr ?? "")
        }
        return nil
    }
}