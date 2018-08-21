
//
//  RectangleBuilderGreaterArea.swift
//  Practice
//
//  Created by Ashwani Hundwani on 20/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class RectangleBuilderGreaterArea: NSObject {
    
    private static func factorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 1 {
            result *= n
            n -= 1
        }
        return result
    }
    
    private static func combinations(N:Int, R:Int) -> Int {
        return factorial(N) / (factorial(R) * factorial(N - R))
    }
    
    public static func solution(_ A : inout [Int], _ X : Int) -> Int {
        
        var possibleRectangles = 0
        var fenceCountDict = Dictionary<Int, Int?>()
        for item in A {
            if let temp = fenceCountDict[item] {
                fenceCountDict[item] = temp! + 1
            }
            else {
                fenceCountDict[item] = 1
            }
        }
        
        // Search for Squares
        for key in fenceCountDict.keys {
            let temp = fenceCountDict[key]!!
            if temp >= 4 && key * key >= X {
                possibleRectangles += 1
            }
        }
        
        // Remove all fences with only one occurrence
        for key in fenceCountDict.keys  {
            if fenceCountDict[key]!! <= 1 {
                fenceCountDict.removeValue(forKey: key)
            }
        }
        
        var ineligibleFences = 0
        var filteredKeys = fenceCountDict.keys.sorted(by: <)
        if filteredKeys.count > 1 {
            for i in 0...filteredKeys.count - 2 {
                if filteredKeys[i] * filteredKeys[i + 1] < X {
                    ineligibleFences += 1
                }
                else {
                    break
                }
            }
            possibleRectangles += combinations(N: filteredKeys.count, R: 2) - combinations(N: ineligibleFences + 1, R: 2)
        }
        
        return possibleRectangles > 1000000000 ? -1 : possibleRectangles
    }

}
