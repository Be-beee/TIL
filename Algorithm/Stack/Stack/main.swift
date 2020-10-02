//
//  main.swift
//  Stack
//
//  Created by 서보경 on 2020/08/31.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

struct IntStack {
    var items: [Int] = []
    
    func depth() -> Int {
        return items.count
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    func top() -> Int? {
        return items.last
    }
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 제네릭을 활용한 스택
struct Stack<T> {
    var items: [T] = []
    var depth: Int {
        return items.count
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
    var top: T? {
        return items.last
    }
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T? {
        return (depth == 0) ? nil : items.removeLast()
    }
}

// MARK:- 프로그래머스 문제: 올바른 괄호

func solution(_ s:String) -> Bool
{
    var ans:Bool = true
    var stack = Stack<String>()

    for i in s {
        let item = String(i)
        if item == "(" {
            stack.push(item)
        } else if stack.depth == 0 {
            ans = false
            break
        } else {
            stack.pop()
        }
    }
    if stack.depth != 0 {
        ans = false
    }
    
    return ans
}
