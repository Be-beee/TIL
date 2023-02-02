//
//  main.swift
//  spiral_9461
//
//  Created by 서보경 on 2020/10/04.
//

import Foundation

// MARK: - 9461 파도반 수열
// https://www.acmicpc.net/problem/9461

var memo: [Int] = Array(repeating: 0, count: 101)

func spiral(_ n: Int) -> Int {
    if n <= 5 {
        if n <= 3 {
            return 1
        } else {
            return 2
        }
    } else if memo[n] != 0 {
        return memo[n]
    } else {
        memo[n] = spiral(n-1) + spiral(n-5)
        return memo[n]
    }
}

let test_case = Int(readLine()!)!

for _ in 0 ..< test_case {
    let n = Int(readLine()!)!
    print(spiral(n))
}
