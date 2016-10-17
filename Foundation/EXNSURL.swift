//
//  EXNSURL.swift
//  ReuseCode
//
//  Created by huanghe on 7/25/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation


extension URL {
    
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
    
    /// EZSE: Returns true of given file is a directory
    public var fileIsDirectory: Bool {
        var isdirv: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&isdirv, forKey: URLResourceKey.isDirectoryKey)
        } catch _ {
        }
        return isdirv?.boolValue ?? false
    }
    
    
    
}
