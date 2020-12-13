//
//  main.swift
//  balance_4949
//
//  Created by 서보경 on 2020/12/14.
//

import Foundation

// MARK:- 4949 균형잡힌 세상
// https://www.acmicpc.net/problem/4949

func isBalanced(_ str: String) -> Bool {
    var stack: [Character] = []
    for c in str {
        if c == "[" || c == "(" {
            stack.append(c)
        } else if c == ")", let last = stack.last, last == "(" {
            stack.removeLast()
        } else if c == "]", let last = stack.last, last == "[" {
            stack.removeLast()
        } else if c.isLetter || c.isWhitespace || c == "." {
            continue
        } else {
            return false
        }
    }
    
    return stack.count == 0
}

while let input = readLine() {
    if input == "." { break }
    if isBalanced(input) {
        print("yes")
    } else {
        print("no")
    }
}
