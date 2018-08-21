//
//  LongestNRCS.swift
//  Practice
//
//  Created by Ashwani Hundwani on 15/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class LongestNRCS: NSObject {
    
    public func NRCS(string:String) -> Int {
        
        if string.isEmpty {
            return 0
        }
        
        var visited:Dictionary<Character, Int?> = Dictionary<Character, Int?>()
        visited[string.first!] = 0
        var currentLength = 1
        var maxLength = 0
        let strIndex = string.index(string.startIndex, offsetBy: 1)
        var currentSubstr:String = string.substring(to: strIndex)
        var longest:String = ""
        var index = 1
        var tempString = string
        tempString.remove(at: string.startIndex)
        for char in tempString.characters {
            
            var previousIndex = -1
            if let temp = visited[char] {
                previousIndex = temp!
            }
            
            if previousIndex == -1 ||  index - currentLength > previousIndex {
                currentLength += 1
                currentSubstr.append(char)
            }
            else {
                if maxLength < currentLength {
                    maxLength = currentLength
                    longest = currentSubstr
                }
                currentSubstr = String(char)
                currentLength = index - previousIndex
            }
            visited[char] = index
            
            index += 1
        }
        
        if maxLength < currentLength {
            maxLength = currentLength
            longest = currentSubstr
        }
        
        print(longest)
        return maxLength
        
    }

}
