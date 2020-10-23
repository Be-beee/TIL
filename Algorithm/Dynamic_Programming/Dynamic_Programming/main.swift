//
//  main.swift
//  Dynamic_Programming
//
//  Created by 서보경 on 2020/10/22.
//

import Foundation


// MARK: - Dynamic Programming - 동적 계획법
// with Fibonacci

var dp = Array(repeating: 0, count: 100)

// MARK: - Top-down

func fibo(_ x: Int) -> Int {
    if x == 1 || x == 2 {
        return 1
    }
    if dp[x] != 0 {
        return dp[x]
    }
    
    dp[x] = fibo(x-1) + fibo(x-2)
    return dp[x]
}


// MARK: - Bottom-up

func fibo_bottom(_ x: Int) -> Int {
    dp[1] = 1
    dp[2] = 1

    for i in 3 ..< x+1 {
        dp[i] = dp[i-1]+dp[i-2]
    }
    return dp[x]
}
