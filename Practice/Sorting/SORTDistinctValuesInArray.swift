//
//  SORTDistinctValuesInArray.swift
//  Practice
//
//  Created by Ashwani Hundwani on 05/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class SORTDistinctValuesInArray: NSObject {
    
    public func solution(_ A : inout [Int]) -> Int {
        
        if(A.count == 0) {
            return 0
        }
        else if A.count == 1 {
            return 1
        }
        
        A = A.sorted()
        var distinctValues = 1
        
        for i in 1...A.count - 1 {
            if A[i] != A[i - 1] {
                distinctValues += 1
                
            }
        }
        
        return distinctValues
    }

}
