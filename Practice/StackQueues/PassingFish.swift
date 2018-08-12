
//
//  PassingFish.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class FishStack : NSObject {
    var stack:[(Int, Int)] = []
    
    func pop() {
        stack.removeLast()
    }
    func peek() -> (Int, Int)?{
        return stack.last
    }
    func push(fish:(Int, Int)) {
        stack.append(fish)
    }
    @discardableResult
    func isEmpty()-> Bool{
        return (stack.count == 0)
    }
    
    func fishCount() -> Int {
        return stack.count
    }
}

class PassingFish: NSObject {
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        let stack = FishStack()
        if A.count == 0 {
            return 0
        }
        
        print(NSDate())
        for i in 0...A.count - 1 {
            if stack.isEmpty() {
                stack.push(fish: (A[i], B[i]))
            }else {
                
                if stack.peek()!.1 == B[i] || (stack.peek()!.1 == 0 && B[i] == 1) {
                    stack.push(fish: (A[i], B[i]))
                    
                }
                else {
                    while B[i] != stack.peek()!.1  && A[i] > stack.peek()!.0 {
                        stack.pop()
                        if stack.peek() == nil {
                            break
                        }
                    }
                    
                    if stack.isEmpty() || B[i] == stack.peek()!.1  {
                       stack.push(fish: (A[i], B[i]))
                    }
                }
            }
        }
        print(NSDate())
        return stack.fishCount()
    }

}
