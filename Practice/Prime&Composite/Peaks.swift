//
//  Peaks.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class Peaks: NSObject {
    
    public static func divisorsArray(N: Int)-> [Int]{
        var divisors:[Int] = []
        
        var i = 2
        while i * i < N {
            if N % i == 0 {
                divisors.append(i)
                divisors.append(N / i)
            }
            i += 1
        }
        
        
        divisors = divisors.reversed()
        
        return divisors
    }

    public static func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        var twoDimensionalArray:Array<Array<Int>> = [[]]
        let divisors = divisorsArray(N: A.count)
        
        if divisors.count == 1 {
            for i in 1...A.count - 2 {
                if A[i] > A[i-1] && A[i] > A[i+1] {
                    return 1
                }
            }
            
            return 0
        }
        
        for divisor in divisors {
            twoDimensionalArray = Array(repeating: Array(repeating: 0, count: A.count / divisor), count: divisor)
            
            var validPeak = false
            for j in 0...twoDimensionalArray.count - 1 {
                for k in 1...twoDimensionalArray[j].count - 1 {
                    if twoDimensionalArray[j][k] > twoDimensionalArray[j][k-1] {
                        if k + 1 < divisor
                            && twoDimensionalArray[j][k] > twoDimensionalArray[j][k + 1]{
                            validPeak = true
                        }
                        else if twoDimensionalArray[j][k] > twoDimensionalArray[j+1][0] {
                            validPeak = true
                        }
                        else {
                            validPeak = false
                            break
                        }
                    }
                }
                
                if validPeak == false {
                    break
                }
            }
            
            if validPeak == true {
                return divisor
            }
        }
        
        return 0
    }
}
