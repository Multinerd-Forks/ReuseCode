//
//  throw.swift
//  ReuseCode
//
//  Created by huanghe on 11/2/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation

enum MyError: Error {
    case SampleError
}

func throwMe(shouldThrow: Bool) throws -> Bool {
    if shouldThrow {
        throw MyError.SampleError
    }
    return true
}
