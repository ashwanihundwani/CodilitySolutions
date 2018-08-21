//
//  LogestPassword.swift
//  Practice
//
//  Created by Ashwani Hundwani on 15/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa


extension String {
    var letterCount : Int {
        return self.unicodeScalars.filter({ CharacterSet.letters.contains($0) }).count
    }
    
    var digitCount : Int {
        return self.unicodeScalars.filter({ CharacterSet.decimalDigits.contains($0) }).count
    }
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}




class LogestPassword: NSObject {
    
    public static func solution(_ S : inout String) -> Int {
        // write your code in Swift 3.0 (Linux)
        if S.isEmpty {
            return -1
        }
        var longestWord:String? = nil
        var tempLongestWord:String? = nil
        
        let words = S.components(separatedBy: CharacterSet(charactersIn: " "))
        
        
        for word in words {
            if word.isAlphanumeric
            && word.digitCount % 2 == 1
            && word.letterCount % 2 == 0{
                tempLongestWord = word
            }
            if let _ = tempLongestWord {
                if let _ = longestWord {
                    if tempLongestWord!.characters.count > longestWord!.characters.count {
                        longestWord = tempLongestWord
                    }
                }
                else {
                    longestWord = tempLongestWord
                }
            }
            
        }
        
        if let _ = longestWord {
             return longestWord!.characters.count
        }
        
        return -1
       
    }

}
