//
//  EXInt.swift
//  ReuseCode
//
//  Created by huanghe on 7/12/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation


let billion = 1_000_000_000.0
let million = 1_000_000.0
let thousand = 1_000.0

public extension Int {
    
    func numberToHuman(showZero: Bool = false) -> String {
        if self == 0 && !showZero { return "" }
        
        let double = Double(self)
        let num: Float
        let suffix: String
        if double >= billion {
            num = Float(round(double / billion * 100.0) / 100.0)
            suffix = "B"
        }
        else if double >= million {
            num = Float(round(double / million * 100.0) / 100.0)
            suffix = "M"
        }
        else if double >= thousand {
            num = Float(round(double / thousand * 100.0) / 100.0)
            suffix = "K"
        }
        else {
            num = Float(round(double * 100.0) / 100.0)
            suffix = ""
        }
        var strNum = "\(num)"
        let strArr = strNum.characters.split { $0 == "." }.map { String($0) }
        if strArr.last == "0" {
            strNum = strArr.first!
        }
        return "\(strNum)\(suffix)"
    }
    
    func localizedStringFromNumber() -> String {
        if self == 0 {
            return ""
        }
        return NumberFormatter.localizedString(from: NSNumber(value: self as Int), number: NumberFormatter.Style.decimal)
    }
    
}
