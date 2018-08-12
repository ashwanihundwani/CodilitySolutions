//
//  RangeDivisibleByNumber.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class RangeDivisibleByNumber: NSObject {
    
    public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
        // write your code in Swift 3.0 (Linux)
        // Add 1 explicitly as A is divisible by M
        if (A % K == 0) {
            return (B / K) - (A / K) + 1;
        }
        else {
            return (B / K) - (A / K);
        }
        // A is not divisible by M
        
    }

}
