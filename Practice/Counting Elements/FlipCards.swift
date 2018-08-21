
//
//  FlipCards.swift
//  Practice
//
//  Created by Ashwani Hundwani on 14/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class FlipCards: NSObject {
    
    public static func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        var missingPositive = MissingPositiveInteger().solution(&A)
        
        return 0
        
    }

}
