//
//  Factors.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class Factors: NSObject {
    public static func solution(_ N : Int) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        var i = 1
        var result = 0
        while i * i < N {
            if N % i == 0 {
                result += 2
            }
            i += 1
        }
        
        if i * i == N {
            result += 1
        }
        
        return result
    }

}
