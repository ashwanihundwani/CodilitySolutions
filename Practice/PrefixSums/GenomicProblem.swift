//
//  DNA2DArrayProblem.swift
//  Practice
//
//  Created by Ashwani Hundwani on 05/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class DNA2DArrayProblem: NSObject {
    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        // write your code in Swift 3.0 (Linux)
        
        var genoms = Array(repeating: Array(repeating: 0, count: S.characters.count + 1), count: 3)
        var i:Int = 0
        for character in S.characters {
            var a = 0, c = 0, g = 0
            if(character == "A") {
                a = 1
            }
            else if(character == "C") {
                c = 1
            }
            else if(character == "G") {
                g = 1
            }
            
            genoms[0][i+1] = genoms[0][i] + a;
            genoms[1][i+1] = genoms[1][i] + c;
            genoms[2][i+1] = genoms[2][i] + g;
            
            i += 1
        }
        
        var result:[Int] = Array(repeating: 0, count: P.count)
        for i in 0...P.count - 1 {
            let fromIndex = P[i]
            let toIndex = Q[i] + 1
            
            if (genoms[0][toIndex] - genoms[0][fromIndex] > 0) {
                result[i] = 1;
            } else if (genoms[1][toIndex] - genoms[1][fromIndex] > 0) {
                result[i] = 2;
            } else if (genoms[2][toIndex] - genoms[2][fromIndex] > 0) {
                result[i] = 3;
            } else {
                result[i] = 4;
            }
        }
        
        return result
    }

}
