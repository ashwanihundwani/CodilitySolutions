//
//  Brackets.swift
//  Practice
//
//  Created by Ashwani Hundwani on 10/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class Stack : NSObject {
    var stack:[Character] = [Character]()
    
    func pop() {
        stack.removeLast()
    }
    func peek() -> Character?{
        return stack.last
    }
    func push(character:Character) {
        stack.append(character)
    }
}

class Brackets: NSObject {
    
    public func solution(_ S : inout String) -> Int {
        
        if S.characters.count == 0 {
            return 1
        }
        
        if S.characters.count % 2 == 1 {
            return 0
        }
        
        let index = S.index(S.startIndex, offsetBy: 1)
        if S.substring(to: index) == ")"
        || S.substring(to: index) == "]"
            || S.substring(to: index) == "}" {
            return 0
        }
        // write your code in Swift 3.0 (Linux)
        let stack:Stack = Stack()
        let characters = S.characters
        for char in characters {
            if char == "{" || char == "[" || char == "(" {
                stack.push(character: char)
            }
            else {
                
                if let temp = stack.peek() {
                    if char == "}" && temp == "{" {
                        stack.pop()
                    }
                    else if char == "]" && temp == "[" {
                        stack.pop()
                    }
                    else if char == ")" && temp == "(" {
                        stack.pop()
                    }
                }
                else {
                    return 0
                }
                
            }
        }
        
        if let _ = stack.peek() {
            return 0
        }
        
        return 1
    }

}
