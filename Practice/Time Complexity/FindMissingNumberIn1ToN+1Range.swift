//
//  FindMissingNumberIn1ToN+1Range.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class FindMissingNumberIn1ToN_1Range: NSObject {
    public func solution(_ A : inout [Int]) -> Int {
        var nextVal = 0
        
        for i in 0...A.count - 1 {
            var val = A[i]
            while(val == A.count + 1 || A[val - 1] != val) {
                if(i == A.count - 1 && val == A.count + 1) {
                    break
                }
                
                if val == A.count + 1 {
                    if(A.last! == val) {
                        break
                    }
                    nextVal = A.last!
                    A[A.count - 1] = val
                    val = nextVal
                }
                else {
                    nextVal = A[val - 1]
                    A[val - 1] = val
                    val = nextVal
                }
            }
        }
        
        for i in 0...A.count - 1 {
            if A[i] != i + 1 {
                return i + 1
            }
        }
        return 0
    }

}
