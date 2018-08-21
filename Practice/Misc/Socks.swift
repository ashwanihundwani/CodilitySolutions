
//
//  Socks.swift
//  Practice
//
//  Created by Ashwani Hundwani on 19/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class Socks: NSObject {
    
    public static func solution(_ K : Int, _ C : inout [Int], _ D : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        var pairs = 0
        var dictC:Dictionary<Int, Int?> = Dictionary<Int, Int?>()
        var dictD:Dictionary<Int, Int?> = Dictionary<Int, Int?>()
        var usedSocks = 0
        for sock in C {
            if let _ = dictC[sock] {
                pairs += 1
                dictC.removeValue(forKey: sock)
            }
            else {
                dictC[sock] = 1
            }
        }
        
        for sock in D {
            if let temp = dictD[sock] {
                dictD[sock] = temp! + 1
            }
            else {
                dictD[sock] = 1
            }
        }
        
        for key in dictC.keys {
            if let temp = dictD[key] {
                if (K > usedSocks) {
                    pairs += 1
                    if(temp! > 1) {
                        dictD[key] = temp! - 1
                    }
                    else {
                        dictD.removeValue(forKey: key)
                    }
                    
                    usedSocks += 1
                    
                }
                else {
                    return pairs
                }
            }
        }
        
        for key in dictD.keys {
            let socksOfThisColor:Int = dictD[key]!!
            if socksOfThisColor > 1 {
                if socksOfThisColor <= (K - usedSocks) {
                    pairs += socksOfThisColor / 2
                    if socksOfThisColor % 2 == 0 {
                         usedSocks += socksOfThisColor
                    }else {
                        usedSocks += socksOfThisColor - 1
                    }
                }
                else {
                    let possibleSocks = K - usedSocks
                    pairs += possibleSocks / 2
                    return pairs
                }
            }
        }
        
        
        return pairs
        
    }

}
