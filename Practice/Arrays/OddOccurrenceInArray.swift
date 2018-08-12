//
//  OddOccurrenceInArray.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class OddOccurrenceInArray: NSObject {

    public func solution(_ A : inout [Int]) -> Int {
        var dictionary:Dictionary<Int, Int?> = Dictionary<Int, Int>()
        if(A.count%2 == 0) {
            return 0
        }
        
        for item in A {
            if let _ = dictionary[item] {
                dictionary[item] = dictionary[item]!! + 1
            }
            else {
                dictionary[item] = 1
            }
        }
        
        for key in dictionary.keys {
            guard let value = dictionary[key], value!%2 == 0  else {
                return key
            }
        }
        return 0
        
    }
}
