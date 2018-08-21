
//
//  FloodDepth.swift
//  Practice
//
//  Created by Ashwani Hundwani on 15/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

// currDepth = 0
// curr_peak
// curr_low
// uptrend/downtrend
// i <= i + 1 && i + 1 >= peak => peak = i
// i > i + 1 => depth = peak - val(i + 1)

class FloodDepth: NSObject {
    
    
    public static func solution(_ A : inout [Int]) -> Int {
        
        var maxHeight = 0
        var minHeight = 0
        var maxDepth = 0
        
        for a in A {
            var depth = 0
            if a > maxHeight {
                depth = maxHeight - minHeight
                maxHeight = a
                minHeight = a
            }
            else if a < minHeight {
                minHeight = a
            }
            else {
                depth = a - minHeight
            }
            
            if depth > maxDepth {
                maxDepth = depth
            }
        
        }
        
        
        return maxDepth
        
    }

}
