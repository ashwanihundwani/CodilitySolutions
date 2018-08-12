//
//  PassingFishOptimized.swift
//  Practice
//
//  Created by Ashwani Hundwani on 11/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa
class FishIntStack : NSObject {
    var stack:[Int] = []
    
    func pop() {
        stack.removeLast()
    }
    func peek() -> Int?{
        return stack.last
    }
    func push(fish:Int) {
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

class PassingFishOptimized: NSObject {
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        let s = FishIntStack()
        
        for i in 0...A.count - 1 {
            let size = A[i]
            let dir = B[i]
            
            if s.isEmpty() {
                s.push(fish: i)
            }
            else {
                while(!s.isEmpty() && dir - B[s.peek()!] == -1 && A[s.peek()!] < size){
                    s.pop()
                }
                if(!s.isEmpty()){
                    if(dir - B[s.peek()!] != -1) {
                        s.push(fish: i)
                    }
                }
                else{
                    s.push(fish:i)
                }
            }
            
        }
        
        return s.fishCount()
    }
}
