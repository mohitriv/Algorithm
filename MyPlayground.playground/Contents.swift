import Foundation
import UIKit

func isPalindrome(string: String?) -> Bool {
    
    guard let string = string, string.count > 0 else {
        return false
    }
    
    let updatedString = string.replacingOccurrences(of: " ", with: "")
    
    var chars = Array(updatedString)
    
    var start = 0
    var end = string.count - 1
    
    while start < end {
        if chars[start] != chars[end] {
            return false
        } else {
            start += 1
            end -= 1
        }
    }
    return true
}

isPalindrome(string: "ab ffc ba")
