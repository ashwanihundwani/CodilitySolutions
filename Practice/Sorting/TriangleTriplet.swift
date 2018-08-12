//
//  TriangleTriplet.swift
//  Practice
//
//  Created by Ashwani Hundwani on 09/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class TriangleTriplet: NSObject {
    public func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        if(A.count < 3) {
            return 0
        }
        A = A.sorted()
        for i in 0...A.count - 3 {
            
            if A[i] + A[i+1] > A[i + 2]
                && A[i + 1] + A[i+2] > A[i]
                && A[i + 2] + A[i] > A[i + 1] {
                return 1
            }
        }
        return 0
    }
}
