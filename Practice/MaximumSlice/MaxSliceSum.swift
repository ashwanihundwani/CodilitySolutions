//
//  MaxSliceSum.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class MaxSliceSum: NSObject {

    public static func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        if(A.count == 1) {
            return A[0]
        }

        var maxSlice = A.min()!
        var maxEnding = 0
    
        
        for i in 0...A.count - 1 {
            maxEnding = max(A[i], maxEnding + A[i])
            maxSlice = max(maxSlice, maxEnding)
        }
        return maxSlice
    }

}
