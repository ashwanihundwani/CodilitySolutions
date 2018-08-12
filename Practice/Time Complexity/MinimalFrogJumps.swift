//
//  MinimalFrogJumps.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class MinimalFrogJumps: NSObject {
    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        let totalDisplacement = Y - X
        // write your code in Swift 3.0 (Linux)
        if (totalDisplacement) % D == 0 {
            return (totalDisplacement)/D
        }
        else {
            return (totalDisplacement / D) + 1
        }
    }

}
