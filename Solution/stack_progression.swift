//
//  main.swift
//  stack_progression_1874
//
//  Created by 서보경 on 2020/10/05.
//

import Foundation

// MARK: - 1874 스택 수열
// https://www.acmicpc.net/problem/1874

struct Stack {
    var items: [Int] = []
    var top: Int {
        return items.last ?? -1
    }
    
    mutating func pop() {
        items.removeLast()
    }
    mutating func push(item: Int) {
        items.append(item)
    }
}

let input = Int(readLine()!)!
var p = 0
var wanted: [Int] = []
var result: [String] = []
var isPossible = true
var stack = Stack()
for _ in 0 ..< input {
    let value = Int(readLine()!)!
    wanted.append(value)
}

for i in 1 ... input {
    while stack.top != -1, stack.top == wanted[p] {
        stack.pop()
        result.append("-")
        p += 1
    }
    stack.push(item: i)
    result.append("+")
}

while stack.top != -1, p < input {
    if stack.top == wanted[p] {
        stack.pop()
        result.append("-")
        p += 1
    } else {
        isPossible = false
        break
    }
}

if isPossible {
    for item in result {
        print(item)
    }
} else {
    print("NO")
}

