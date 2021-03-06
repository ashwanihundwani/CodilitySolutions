//
//  Dominator.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class Dominator: NSObject {
    
    public static func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        if A.count == 0 {
            return -1
        }
        var value = -1
        var size = 0
        var leader = -1
        var candidate = -1
        
        for i in 0...A.count - 1 {
            if(size == 0) {
                size += 1
                value = A[i]
            }
            else {
                if A[i] == value {
                    size += 1
                }
                else {
                    size -= 1
                }
            }
        }
        
        if size > 0 {
            candidate = value
        }
        var count = 0
        
        for i in 0...A.count - 1 {
            if A[i] == candidate {
                count += 1
            }
        }
        
        if count > A.count / 2 {
            leader = candidate
            return A.index(of: leader)!
        }
        else {
            return -1
        }
        
    }

}
