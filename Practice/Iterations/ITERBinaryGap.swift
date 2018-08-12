//
//  BinaryGap.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class BinaryGap: NSObject {
    public func solution(_ N : Int) -> Int {
        
        if N <= 0 {
            return 0
        }
        // write your code in Swift 3.0 (Linux)
        let binaryStr = String(N, radix:2)
        let trimmedStr = binaryStr.trimmingCharacters(in: CharacterSet(charactersIn: "0"))
        var longestGap = 0
        var tempGap = 0
        for char in trimmedStr.characters {
            if(char == "1") {
                if longestGap < tempGap {
                    longestGap = tempGap
                }
                tempGap = 0
            }
            else {
                tempGap = tempGap + 1
            }
            
        }
        return longestGap
    }

}
