//
//  MaximumShareProfit.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class MaximumShareProfit: NSObject {
    
    
    public static func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        if(A.count < 2) {
            return 0
        }
        var maxProfitEnding = 0
        var maxSliceProfit = 0
        
        for i in 0...A.count - 2 {
            maxProfitEnding = max(0, maxProfitEnding + A[i+1] - A[i])
            maxSliceProfit = max(maxSliceProfit, maxProfitEnding)
        }
        return maxSliceProfit
    }

}
