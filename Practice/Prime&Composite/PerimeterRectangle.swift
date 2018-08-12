
//
//  PerimeterRectangle.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class PerimeterRectangle: NSObject {
    
    public static func solution(_ N : Int) -> Int {
        // write your code in Swift 3.0 (Linux)
        var minimumSumOfFactors = N + 1 // worst case if N is prime
        var i = 1
        
        while i * i <= N {
            if N % i == 0 {
                minimumSumOfFactors = min(minimumSumOfFactors, (N / i) + i)
            }
            i += 1
        }
        
        return 2 * minimumSumOfFactors
    }
}
