//
//  EXString.swift
//  ReuseCode
//
//  Created by huanghe on 7/12/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation




extension String {
    /**
     is contation chinese
     - returns: true contation false not contation
     */
    func contationChinese() -> Bool {
        for char in utf16 {
            if (char > 0x4e00 && char < 0x9fff) {
                return true
            }
        }
        return false
    }
    
    var length: Int {
        get {
            return characters.count
        }
    }
    
    /**
     Determine whether contain the specified string
     - parameter substring: target string
     - returns: true: contain false: uncontain
     */
    func contains(substring: String) -> Bool {
        return rangeOfString(substring) != nil
    }
    
    /**
     Determine whether pure Numbers
     */
    func isNumeric() -> Bool {
        if let _ = NSNumberFormatter().numberFromString(self) {
            return true
        }
        return false
    }
    
    /**
     Intercepting a string of specified range
     - parameter r: specified range
     - returns: the range string
     */
    subscript(r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex - r.startIndex)
            return self[startIndex..<endIndex]
        }
    }
    
    /**
     According to the starting position and the length of the interception of a string
     - parameter startIndex: start position
     - parameter length:     expected length
     - returns: the subed string
     */
    func substring(startIndex: Int, length: Int) -> String {
        let start = self.startIndex.advancedBy(startIndex)
        let end = self.startIndex.advancedBy(startIndex + length)
        return self[start..<end]
    }
    
    /**
     format a string to NSDate
     - parameter format: e.g yyyy-MM-dd
     - returns: an optional NSDate object
     */
    func toDate(format: String = "yyyy-MM-dd HH:mm:ss") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
}