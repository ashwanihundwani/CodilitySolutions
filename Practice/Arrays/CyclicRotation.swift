//
//  ArrayRotation.swift
//  Practice
//
//  Created by Ashwani Hundwani on 04/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class ArrayRotation: NSObject {

    //Rotate array with reversal mechanism
    public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
        
        if(A.count == 0) {
            return A
        }
        let count = A.count
        let rotations = K % count
        
        if(rotations == 0) {
            return A
        }
        
        var limit1stArray = count - rotations
        
        var temp = 0
        
        //Rotate 1st Part
        for i in 0 ... (limit1stArray / 2) -  1 {
            
            temp = A[i]
            A[i] = A[limit1stArray - i - 1]
            A[limit1stArray - i - 1] = temp
        }
        
        //Rotate 2nd part
        var iter = 0
        
        for i in count - rotations ... count - 1 {
            if(i == count - iter - 1) {
                break
            }
            temp = A[i]
            A[i] = A[count - iter - 1]
            A[count - iter - 1] = temp
            iter = iter + 1
        }
        
        //Rotate complete array
        for i in 0...count / 2 - 1 {
            temp = A[i]
            A[i] = A[count - i - 1]
            A[count - i - 1] = temp
        }
        
        return A
    }

}
