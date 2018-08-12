//
//  FrogLeavesRiverProblem.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class FrogLeavesRiverProblem: NSObject {
    
    public func solution(_ X : Int, _ A : inout [Int]) -> Int {
        var leaves:[Int] = Array<Int>.init(repeating: 0, count: X)
        
        var index = 0
        var leavesCount = 0
        for item in A {
            if item <= X {
                if leaves[item - 1] != item {
                    leaves[item - 1] = item
                    leavesCount += 1
                }
            }
            if(leavesCount == X) {
                return index
            }
            index = index + 1
        }
        return -1
    }

}
