//
//  main.swift
//  ValidParentheses
//
//  Created by 서보경 on 2023/02/06.
//

import Foundation

// MARK: - 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses

class Solution {
    func isValid(_ s: String) -> Bool {
        let dict = [ ")": "(", "]": "[", "}": "{" ]
        let arr = Array(s)
        var stack: [String] = []
        
        for item in arr {
            let str = String(item)
            if dict.values.contains(str) {
                stack.append(str)
            } else if dict[str] == stack.last {
                stack.removeLast()
            } else { return false }
        }
        
        if stack.isEmpty { return true }
        else { return false }
    }
}
