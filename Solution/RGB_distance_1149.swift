//
//  main.swift
//  RGB_distance_1149
//
//  Created by 서보경 on 2021/04/24.
//

// MARK:- 1149 RGB 거리
// https://www.acmicpc.net/problem/1149

let n = Int(readLine()!)!
var costs: [[Int]] = []
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: n)

for _ in 0 ..< n {
    let cost = readLine()!.split(separator: " ").map{ Int(String($0))! }
    costs.append(cost)
}

dp[0] = costs[0]

for i in 1 ..< n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + costs[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + costs[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + costs[i][2]
}

print(dp[dp.count-1].min() ?? -1)
