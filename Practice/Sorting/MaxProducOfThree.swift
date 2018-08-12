//
//  MaxProducOfThree.swift
//  Practice
//
//  Created by Ashwani Hundwani on 05/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class MaxProducOfThree: NSObject {
    
    public func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        A = A.sorted()
        if(A.count < 3) {
            return 0
        }
        var finalMax = 0
        let possible1 = A[0] * A[1] * A[A.count - 1]
        let possible2 = A[0] * A[A.count - 1] * A[A.count - 2]
        finalMax = max(possible1, possible2)
        let possible3 = A[A.count - 3] * A[A.count - 1] * A[A.count - 2]
        finalMax = max(finalMax, possible3)
        
        return finalMax
    }

}
