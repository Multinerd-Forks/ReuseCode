//
//  EXNSURL.swift
//  ReuseCode
//
//  Created by huanghe on 7/25/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation


extension NSURL {
    
    public var queryParameters: [String: String]? {
        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: true), queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
    
    /// EZSE: Returns remote size of url, don't use it in main thread
    public func remoteSize(completionHandler: ((contentLength: Int64) -> Void), timeoutInterval: NSTimeInterval = 30) {
        let request = NSMutableURLRequest(URL: self, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
        request.HTTPMethod = "HEAD";
        request.setValue("", forHTTPHeaderField: "Accept-Encoding")
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (_, response, _) -> Void in
            let contentLength: Int64 = response?.expectedContentLength ?? NSURLSessionTransferSizeUnknown
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                completionHandler(contentLength: contentLength)
            })
        }).resume()
    }
    
    public func isSameWithURL(url: NSURL) -> Bool {
        if self == url {
            return true
        }
        if self.scheme.lowercaseString != url.scheme.lowercaseString {
            return false
        }
        if let host1 = self.host, host2 = url.host {
            let whost1 = host1.hasPrefix("www.") ? host1 : "www." + host1
            let whost2 = host2.hasPrefix("www.") ? host2 : "www." + host2
            if whost1 != whost2 {
                return false
            }
        }
        let pathdelimiter = NSCharacterSet(charactersInString: "/")
        if self.path?.lowercaseString.stringByTrimmingCharactersInSet(pathdelimiter) != url.path?.lowercaseString.stringByTrimmingCharactersInSet(pathdelimiter) {
            return false
        }
        if self.port != url.port {
            return false
        }
        if self.query?.lowercaseString != url.query?.lowercaseString {
            return false
        }
        return true
    }
    
    /// EZSE: Returns true of given file is a directory
    public var fileIsDirectory: Bool {
        var isdirv: AnyObject?
        do {
            try self.getResourceValue(&isdirv, forKey: NSURLIsDirectoryKey)
        } catch _ {
        }
        return isdirv?.boolValue ?? false
    }
    
    
    
}