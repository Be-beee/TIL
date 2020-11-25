//
//  main.swift
//  stack_10828
//
//  Created by 서보경 on 2020/11/25.
//

import Foundation

// MARK: - 10828 스택

let num = Int(readLine()!)!
var stack: [Int] = []
for _ in 0 ..< num {
    let q = readLine()!.split(separator: " ")
    switch q[0] {
    case "push":
        stack.append( Int(String(q[1]))! )
    case "pop":
        if stack.isEmpty { print(-1) }
        else { print(stack.removeLast()) }
    case "size":
        print(stack.count)
    case "empty":
        if stack.isEmpty { print(1) }
        else { print(0) }
    case "top":
        if stack.isEmpty { print(-1) }
        else { print(stack.last!) }
    default:
        break
    }
}
