//
//  NestedParenthesis.swift
//  Practice
//
//  Created by Ashwani Hundwani on 10/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class NestedParenthesis: NSObject {
    
    public func solution(_ S : inout String) -> Int {
        
        var leftBracket = 0
        for char in S.characters {
            if char == "(" {
                leftBracket += 1
            }
            else  {
                leftBracket -= 1
                if leftBracket < 0 {
                    return 0
                }
                
            }
        }
        
        if leftBracket == 0 {
            return 1
        }
        return 0
    }

}
