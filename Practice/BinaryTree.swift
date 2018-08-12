//
//  BinaryTree.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

public class Tree {
    public var x : Int = 0
    public var l : Tree?
    public var r : Tree?
    public init() {}
}

class BinaryTree: NSObject {
    
    public func maxDepth(_ T:Tree?) -> Int {
        guard let _ = T  else{
            return 0
        }
        
        /* compute the depth of each subtree */
        let lDepth = maxDepth(T?.l);
        let rDepth = maxDepth(T?.r);
        
        /* use the larger one */
        if (lDepth > rDepth) {
            return(lDepth+1);
        }
        else {
            return(rDepth+1)
            
        }
    }
    
    public func solution(_ T : Tree?) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        guard let _ = T  else{
            return -1
        }
        
        
        let longestHeightLeft = maxDepth(T?.l)
        let longestHeightRight = maxDepth(T?.r)
        
        
        
        return max(longestHeightLeft, longestHeightRight)
        
    }
}
