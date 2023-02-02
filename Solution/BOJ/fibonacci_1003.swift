//
//  main.swift
//  fibonacci_1003
//
//  Created by 서보경 on 2020/10/22.
//

import Foundation

// MARK: - 1003 피보나치 함수2
// https://www.acmicpc.net/problem/1003

var memo: [(zero: Int, one: Int)] = Array(repeating: (0, 0), count: 41)
func fibo(_ x: Int) -> (Int, Int) {
    if x == 0 {
        memo[x] = (1, 0)
        return (1, 0)
    }
    if x == 1 {
        memo[x] = (0, 1)
        return (0, 1)
    }
    if memo[x] != (0, 0) {
        return memo[x]
    }
    let n1 = fibo(x-1)
    let n2 = fibo(x-2)
    
    memo[x].zero = n1.0 + n2.0
    memo[x].one = n1.1 + n2.1
    return memo[x]
}


let test_case = Int(readLine()!)!

for _ in 0 ..< test_case {
    let input = Int(readLine()!)!
    fibo(input)
    print("\(memo[input].zero) \(memo[input].one)")
}
