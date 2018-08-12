//
//  MissingPositiveInteger.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

import Foundation

class MissingPositiveInteger: NSObject {
    
    // you can write to stdout for debugging purposes, e.g.
    // print("this is a debug message")
    
    public func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        var i = 0
        var allNegativeOrZero = true
        for var val in A {
            if val <= 0 || val > A.count {
                i = i + 1
                continue
            }
            
            allNegativeOrZero = false
            
            val = A[i]
            var nextVal = 0
            while(A[val - 1] != val) {
                nextVal = A[val - 1]
                A[val - 1] = val
                val = nextVal
                if(val <= 0 || val > A.count) {
                    break
                }
            }
            
            i = i + 1
        }
        
        let finalVal = 1
        if allNegativeOrZero == false {
            i = 0
            for _ in A {
                if A[i] != i + 1  {
                    return i + 1
                    
                }
                i = i + 1
            }
            return A.count + 1
        }
        
        return finalVal;
    }

}
