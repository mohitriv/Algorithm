//: Playground - noun: a place where people can play

import Foundation

var input = [1, 3, 4, 5, 7, 9, 11, 13, 15, 19, 20, 22]

func binarySearch(input: [Int], num: Int) -> Bool {
    
    if input.count == 0 {
        return false
    }
    
    let middleIndex = input.count/2
    let middleNum = input[middleIndex]
    
    print(input.count)
    
    if middleNum == num {
        return true
    } else if middleNum > num {
        let arr = input[..<(middleIndex-1)]
        return binarySearch(input: Array(arr), num: num)
    } else {
        let arr = input[(middleIndex+1)...]
        return binarySearch(input: Array(arr), num: num)
    }
}

print(binarySearch(input: input, num: 22))
