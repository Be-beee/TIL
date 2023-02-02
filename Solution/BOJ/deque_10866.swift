//
//  main.swift
//  deque_10866
//
//  Created by 서보경 on 2020/12/30.
//

import Foundation

// MARK: - 10866 덱
// https://www.acmicpc.net/problem/10866

let test_case = Int(readLine()!)!
var deque: [Int] = []
for _ in 0 ..< test_case {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    switch input[0] {
    case "push_front":
        deque.insert(Int(input[1])!, at: 0)
    case "push_back":
        deque.append(Int(input[1])!)
    case "pop_front":
        if let first = deque.first {
            print(first)
            deque = Array(deque.dropFirst())
        } else {
            print(-1)
        }
        
    case "pop_back":
        if let last = deque.last {
            print(last)
            deque.removeLast()
        } else {
            print(-1)
        }
    case "size":
        print(deque.count)
    case "empty":
        let isDequeEmpty = deque.isEmpty ? 1 : 0
        print(isDequeEmpty)
    case "front":
        if let first = deque.first {
            print(first)
        } else {
            print(-1)
        }
    case "back":
        if let last = deque.last {
            print(last)
        } else {
            print(-1)
        }
    default:
        break
    }
    
}
