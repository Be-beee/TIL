//
//  main.swift
//  keylogger_5397
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 5397 키로거
// https://www.acmicpc.net/problem/5397

struct Stack {
    var items: [String] = []
    var top: String {
        return items.last ?? ""
    }
    mutating func pop() -> String? {
        if items.count == 0 {
            return nil
        } else {
            return items.removeLast()
        }
    }
    mutating func push(item: String) {
        items.append(item)
    }
}

let test_case = Int(readLine()!)!

for _ in 0 ..< test_case {
    let input = readLine()!
    var left = Stack()
    var right = Stack()
    
    for item in input {
        if item == "-" {
            left.pop()
        } else if item == "<" {
            if let popped = left.pop() {
                right.push(item: popped)
            }
            
        } else if item == ">" {
            if let popped = right.pop() {
                left.push(item: popped)
            }
        } else {
            left.push(item: String(item))
        }
    }
    var pw = left.items
    let rightPW = right.items.reversed()
    
    pw.append(contentsOf: rightPW)
    
    print(pw.joined())
}
