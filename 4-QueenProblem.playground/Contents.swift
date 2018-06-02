//: Playground - noun: a place where people can play

import UIKit

func canPlaceQueen(matrix: [Int], atRow row: Int, atColumn i: Int) -> Bool {
    for j in 0..<row {
        if matrix[j] == i {
            return false
        } else if abs(row-matrix[j]) == abs(i-j) {
            return false
        } else {
            return true
        }
    }
    return false
}

func fourQueenProblem(matrix: [Int], currentQueen: Int) -> [Int] {
    
    return []
}
