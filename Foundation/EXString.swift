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
    func contains(_ substring: String) -> Bool {
        return range(of: substring) != nil
    }
    
    /**
     Determine whether pure Numbers
     */
    func isNumeric() -> Bool {
        if let _ = NumberFormatter().number(from: self) {
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
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.characters.index(self.startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex..<endIndex]
        }
    }
    
    /**
     According to the starting position and the length of the interception of a string
     - parameter startIndex: start position
     - parameter length:     expected length
     - returns: the subed string
     */
    func substring(_ startIndex: Int, length: Int) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: startIndex)
        let end = self.characters.index(self.startIndex, offsetBy: startIndex + length)
        return self[start..<end]
    }
    
    /**
     format a string to NSDate
     - parameter format: e.g yyyy-MM-dd
     - returns: an optional NSDate object
     */
    func toDate(_ format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
