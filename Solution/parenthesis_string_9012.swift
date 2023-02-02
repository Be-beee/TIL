//
//  main.swift
//  parenthesis_string_9012
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 9012 괄호
// https://www.acmicpc.net/problem/9012

struct PSstack {
    private var items: [String] = []
    
    public mutating func push(_ item: String) {
        items.append(item)
    }
    public mutating func pop() {
        items.removeLast()
    }
    public func height() -> Int {
        return items.count
    }
}

let testcase = Int(readLine() ?? "") ?? 0
var cases: [String] = []

for _ in 0 ..< testcase {
    let item = readLine() ?? ""
    cases.append(item)
}
for str in cases {
    var stack: PSstack = PSstack()
    var isVPS = true
    for c in str {
        if String(c) == "(" {
            stack.push(String(c))
        } else {
            if stack.height() == 0 {
                isVPS = false
                break
            } else {
                stack.pop()
            }
        }
    }
    if stack.height() != 0 {
        isVPS = false
    }
    if isVPS {
        print("YES")
    } else {
        print("NO")
    }
}
