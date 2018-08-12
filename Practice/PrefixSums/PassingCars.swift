//
//  CrossingCars.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class CrossingCars: NSObject {
    public func solution1(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        var counter = 0
        var totalPairs = 0
        for item in A {
            if item == 0 {
                counter += 1
            }
            else if item == 1 && counter > 0 {
                totalPairs += counter
            }
        }
        
        if totalPairs > 1000000000 {
            return -1
        }
        
        return totalPairs
    }


}
