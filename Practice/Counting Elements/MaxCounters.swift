//
//  MaxCounters.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class MaxCounters: NSObject {
    
    public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
        // write your code in Swift 3.0 (Linux)
        
        var counters:[Int] = Array<Int>.init(repeating: 0, count: N)
        
        var maxCount = 0, lastMaxCount = 0
        for item in A {
            if item > 0 && item <= counters.count {
                counters[item - 1] = max(counters[item - 1],lastMaxCount)
                counters[item - 1] += 1
                maxCount = max(counters[item - 1], maxCount)
            }
            else if item == counters.count + 1{
                lastMaxCount = maxCount
            }
        }
        
        for index in 0...counters.count - 1 {
            counters[index] = max(counters[index], lastMaxCount)
        }
        
        return counters
    }

}
