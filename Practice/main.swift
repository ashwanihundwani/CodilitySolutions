//
//  main.swift
//  Practice
//
//  Created by Ashwani Hundwani on 27/07/18.
//  Copyright © 2018 Ashwani Hundwani. All rights reserved.
//

import Foundation

// print("this is a debug message")

//Binary Gap
public func solution1(_ N : Int) -> Int {
    
    if N <= 0 {
        return 0
    }
    // write your code in Swift 3.0 (Linux)
    let binaryStr = String(N, radix:2)
    let trimmedStr = binaryStr.trimmingCharacters(in: CharacterSet(charactersIn: "0"))
    var longestGap = 0
    var tempGap = 0
    print(trimmedStr)
    for char in trimmedStr.characters {
        if(char == "1") {
            if longestGap < tempGap {
                longestGap = tempGap
            }
            tempGap = 0
        }
        else {
            tempGap = tempGap + 1
        }
        
    }
    return longestGap
}

//Rotate array with reversal mechanism
public func solution4(_ A : inout [Int], _ K : Int) -> [Int] {
    
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
    
    print(A)
    
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
    
    print(A)
    
    //Rotate complete array
    for i in 0...count / 2 - 1 {
        temp = A[i]
        A[i] = A[count - i - 1]
        A[count - i - 1] = temp
    }
    
    return A
}

// Rotate array of size N with K steps
public func solution2(_ A : inout [Int], _ K : Int) -> [Int] {
    
    if(A.count == 0) {
        return A
    }
    let count = A.count
    let rotations = K % count
    
    if(rotations == 0) {
        return A
    }
    var temp:[Int] = Array<Int>.init(repeating: 0, count: rotations)
    temp.reserveCapacity(rotations)
    
    var tempNum = 0
    for i in 0...count - 1 {
        
        if i < rotations {
            if(i + rotations > count - 1) {
                
                temp[i%rotations] = A[(i+rotations) % count]
                A[(i+rotations) % count] = A[i]
            }
            else {
                temp[i%rotations] = A[i+rotations]
                A[i+rotations] = A[i]
            }
            
        }
        else if i + rotations > count - 1 {
            A[i + rotations - count] = temp[i%rotations]
        }
        else {
            tempNum = A[i+rotations]
            A[i+rotations] = temp[i%rotations]
            temp[i%rotations] = tempNum
        }
        
        
    }
    
    return A
}

//OddOccurence O(n) & O(n)
public func solution10(_ A : inout [Int]) -> Int {
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

//Odd Occurrence in array O(n) & O(1)

// XOR method to find the odd occurrence in Array
public func solution34(_ A : inout [Int]) -> Int {
    var result = 0
    for item in A {
        result = result ^ item
    }
    
    return result
}

//Frog Jumps
public func solution1(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    let totalDisplacement = Y - X
    // write your code in Swift 3.0 (Linux)
    if (totalDisplacement) % D == 0 {
        return (totalDisplacement)/D
    }
    else {
        return (totalDisplacement / D) + 1
    }
}

// Find missing number in an array of range [1...N+1],
//An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

//Your goal is to find that missing element.

public func solution23(_ A : inout [Int]) -> Int {
    var nextVal = 0
    
    for i in 0...A.count - 1 {
        var val = A[i]
        while(val == A.count + 1 || A[val - 1] != val) {
            if(i == A.count - 1 && val == A.count + 1) {
                break
            }
            
            if val == A.count + 1 {
                if(A.last! == val) {
                    break
                }
                nextVal = A.last!
                A[A.count - 1] = val
                val = nextVal
            }
            else {
                nextVal = A[val - 1]
                A[val - 1] = val
                val = nextVal
            }
        }
    }
    
    for i in 0...A.count - 1 {
        if A[i] != i + 1 {
            return i + 1
        }
    }
    return 0
}

//Array permutation 1,2,3,4,5 sequence check
public func solution2(_ A : inout [Int]) -> Int {
    
    
    var dictionary:Dictionary<Int, Bool> = Dictionary<Int, Bool>()
    var smallestElement = Int.max
    for item in A {
        if(item < 1) {
            return 0
        }
        if item < smallestElement {
            smallestElement = item
        }
        if dictionary[item] == nil {
            dictionary[item] = true
        } else {
            return 0
        }
    }
    
    if(smallestElement != 1) {
        return 0
    }
    
    let expectedSum:Double = Double(A.count) / 2.0 * (2 * Double(smallestElement) + (Double(A.count) - 1.0))
    
    if(Int(expectedSum) != A.reduce(0, +)) {
        return 0
    }
    
    
    return 1
}


//Frog jump river problem
public func solution1(_ X : Int, _ A : inout [Int]) -> Int {
    var leaves:[Int] = Array<Int>.init(repeating: 0, count: X)
    
    var index = 0
    var leavesCount = 0
    for item in A {
        if item <= X {
            if leaves[item - 1] != item {
                leaves[item - 1] = item
                leavesCount += 1
            }
        }
        if(leavesCount == X) {
            return index
        }
        index = index + 1
    }
    return -1
}

public func solution1(_ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var counter = 0
    var totalPairs = 0
    for item in A {
        if item == 0 {
            counter += 1
        }
        else if item == 1 && counter > 0 {
            totalPairs += counter
        }
    }
    
    if totalPairs > 1000000000 {
        return -1
    }
    
    return totalPairs
}

//var A = [0,1,0,1,0,1]

//A = A.reversed()

public func solution12(_ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    A = A.sorted()
    if(A.count < 3) {
        return 0
    }
    var finalMax = 0
    let possible1 = A[0] * A[1] * A[A.count - 1]
    let possible2 = A[0] * A[A.count - 1] * A[A.count - 2]
    finalMax = max(possible1, possible2)
    let possible3 = A[A.count - 3] * A[A.count - 1] * A[A.count - 2]
    finalMax = max(finalMax, possible3)
    
    return finalMax
}

public func solution12332(_ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    
    if(A.count < 3) {
        return 0
    }
    A = A.sorted()
    for i in 0...A.count - 3 {
        
        if A[i] + A[i+1] > A[i + 2]
           && A[i + 1] + A[i+2] > A[i]
            && A[i + 2] + A[i] > A[i + 1] {
            return 1
        }
    }
    return 0
}
public func solution12231(_ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    A = A.sorted(by: >)
    
    var totalIntersections = 0
    
    for i in 0...A.count - 1 {
        if A[i] < A.count - i - 1{
            totalIntersections += (A[i] - 1)
        }
        else {
            totalIntersections += A.count - i - 1
        }
        if totalIntersections > 10000000 {
            return -1
        }
    }
    
    return totalIntersections
}

var string = ""

var alternate = false
for _ in 1...200000 {
    if alternate == false {
        string.append("(")
    }
    else {
        string.append(")")
    }
    
    alternate = !alternate
    
}

string.append("()")

public func solutiondsss(_ S : inout String) -> Int {

    var leftBracket = 0
    for char in S.characters {
        if char == "(" {
            leftBracket += 1
        }
        else  {
            leftBracket -= 1
            if leftBracket < 0 {
                return 0
            }
            
        }
    }
    
    if leftBracket == 0 {
        return 1
    }
    return 0
}

public func solution222(_ T : inout [Int]) -> [Int] {
    // write your code in Swift 3.0 (Linux)
    var distances:[Int] = Array<Int>.init(repeating: 0, count: T.count - 1)
    distances.reserveCapacity(T.count - 1)
    var capitalIndex = -1
    
    for i in 0...T.count {
        if i == T[i] {
            capitalIndex = i
            break
        }
    }
    
    // No capital found, return distances
    if capitalIndex == -1 {
        return distances
    }
    
    for index in 0...T.count - 1 {
        if T[index] == index {
            continue
        }
        var distance = 1
        var temp = T[index]
        while temp != T[capitalIndex] {
            temp = T[temp]
            distance += 1
        }
        
        distances[distance - 1] += 1
        distance = 1
    }
    
    return distances
    
}


public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var totalSwaps = 0
    var previousInA = 0
    var previousInB:Int = 0
    
    for i in 0...A.count - 1 {
        if i == 0 && (A[i] >= A[i + 1] || B[i] >= B[i + 1]) {
            if A[i] < B[i + 1] && B[i] < A[i + 1] {
                let temp = A[i]
                A[i] = B[i]
                B[i] = temp
                totalSwaps += 1
                previousInA = A[i]
                previousInB = B[i]
                continue
            }
            else {
                return -1
            }
        }
        else if (A[i] > previousInA && B[i] > previousInB) || A[i] == B[i]{
            previousInA = A[i]
            previousInB = B[i]
            continue
        }
        else if A[i] <= previousInA || B[i] <= previousInB {
            if A[i] > previousInB && B[i] > previousInA {
                let temp = A[i]
                A[i] = B[i]
                B[i] = temp
                totalSwaps += 1
            }
            else {
                return -1
            }
        }
        
        previousInA = A[i]
        previousInB = B[i]
    }
    
    return totalSwaps
}

<<<<<<< Updated upstream
var A = [5, 3, 7, 7, 10]
var B = [1, 6, 6, 9, 9]

//var C:[Int] = [9, 1, 4, 9, 0, 4, 8, 9, 0, 1]
print(solution(&A, &B))

print(A)
print(B)
=======
// Length of the longest substring without repeating characters (NRCS)

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
 // "ello, World"
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

//
//var C:[Int] = [9, 1, 4, 9, 0, 4, 8, 9, 0, 1]
//print(NRCS(string: "aab"))
//
//var string12 = "test 5 a0A pass007 ?xy1"
//var arr = [1,3,2,1,2, 1, 5 ,3, 3,4,2]
//print(FloodDepth.solution(&arr))

>>>>>>> Stashed changes

print(TennisCourt.solution(3, 3))
var C = [1]
var D = [3,2,5,5]
print(Socks.solution(2, &C, &D))

var AA = [2, 3, 2, 3, 2, 3, 2, 3]
print(RectangleBuilderGreaterArea.solution(&AA, 9))


