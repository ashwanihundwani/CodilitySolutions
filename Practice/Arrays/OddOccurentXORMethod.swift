//
//  OddOccurentXORMethod.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class OddOccurentXORMethod: NSObject {
    public func solution(_ A : inout [Int]) -> Int {
        var result = 0
        for item in A {
            result = result ^ item
        }
        
        return result
    }

}
