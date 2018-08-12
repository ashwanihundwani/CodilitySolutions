//
//  ArrayPermutationCheck.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class ArrayPermutationCheck: NSObject {
    public func solution(_ A : inout [Int]) -> Int {
        
        
        var dictionary:Dictionary<Int, Bool> = Dictionary<Int, Bool>()
        var smallestElement = Int.max
        for item in A {
            if(item < 1) {
                return 0
            }
            if item < smallestElement {
                smallestElement = item
            }
            if dictionary[item] == nil {
                dictionary[item] = true
            } else {
                return 0
            }
        }
        
        if(smallestElement != 1) {
            return 0
        }
        
        let expectedSum:Double = Double(A.count) / 2.0 * (2 * Double(smallestElement) + (Double(A.count) - 1.0))
        
        if(Int(expectedSum) != A.reduce(0, +)) {
            return 0
        }
        
        
        return 1
    }

}
