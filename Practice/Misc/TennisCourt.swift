
//
//  TennisCourt.swift
//  Practice
//
//  Created by Ashwani Hundwani on 19/08/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Cocoa

class TennisCourt: NSObject {
    
    public static func solution(_ P : Int, _ C : Int) -> Int {
        return P / 2 >= C ? C : P / 2
     }

}
