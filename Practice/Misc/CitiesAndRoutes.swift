//
//  CitiesAndRoutes.swift
//  Practice
//
//  Created by Ashwani Hundwani on 14/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

//There is a network of n cities with n-1 routes, one of the cities is the capital.

class CitiesAndRoutes: NSObject {
    
    public func solution(_ T : inout [Int]) -> [Int] {
        // write your code in Swift 3.0 (Linux)
        var distances:[Int] = Array<Int>.init(repeating: 0, count: T.count - 1)
        distances.reserveCapacity(T.count - 1)
        var capitalIndex = -1
        
        for i in 0...T.count {
            if i == T[i] {
                capitalIndex = i
                break
            }
        }
        
        // No capital found, return distances
        if capitalIndex == -1 {
            return distances
        }
        
        for index in 0...T.count - 1 {
            if T[index] == index {
                continue
            }
            var distance = 1
            var temp = T[index]
            while temp != T[capitalIndex] {
                temp = T[temp]
                distance += 1
            }
            
            distances[distance - 1] += 1
            distance = 1
        }
        
        return distances
        
    }

}
