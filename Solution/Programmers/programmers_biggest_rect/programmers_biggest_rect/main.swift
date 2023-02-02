//
//  main.swift
//  programmers_biggest_rect
//
//  Created by 서보경 on 2021/11/13.
//

// 프로그래머스: 가장 큰 정사각형 찾기
// https://programmers.co.kr/learn/courses/30/lessons/12905?language=swift

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var max = 0
    var dp = board
    
    if dp[0][0] == 1 { max = 1 }
    else { max = 0 }
    
    for i in 1 ..< dp.count {
        for j in 1 ..< dp[i].count {
            if board[i][j] != 0 {
                let prev = [dp[i-1][j], dp[i-1][j-1], dp[i][j-1]]
                dp[i][j] = prev.min()! + 1
            }
            if dp[i][j] > max {
                max = dp[i][j]
            }
        }
    }
    return max*max
}
