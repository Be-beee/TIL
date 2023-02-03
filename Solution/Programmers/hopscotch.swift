//
//  main.swift
//  programmers_hopscotch
//
//  Created by 서보경 on 2021/11/12.
//


// 프로그래머스 문제풀이 - 땅따먹기
// https://programmers.co.kr/learn/courses/30/lessons/12913?language=swift

import Foundation

func getMax(_ prevRow: [Int]) -> [(idx: Int, val: Int)] {
    var result: [(idx: Int, val: Int)] = []
    
    var firMax = (idx: 0, val: prevRow[0])
    var secMax = (idx: 1, val: prevRow[1])
    
    if prevRow[0] < prevRow[1] {
        firMax = (idx: 1, val: prevRow[1])
        secMax = (idx: 0, val: prevRow[0])
    }
    
    for (i, v) in prevRow.enumerated() {
        if firMax.idx != i {
            if firMax.val <= v {
                secMax = firMax
                firMax = (i, v)
            } else if secMax.val <= v {
                secMax = (i, v)
            }
        }
    }
    result = [firMax, secMax]
    
    return result
}



func solution(_ land:[[Int]]) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: land.count)
    dp[0] = land[0]
    
    for i in land.indices {
        if i == 0 { continue }
        let maxVals = getMax(dp[i-1])
        for j in land[i].indices {
            if maxVals[0].idx != j {
                dp[i][j] = land[i][j] + maxVals[0].val
            } else {
                dp[i][j] = land[i][j] + maxVals[1].val
            }
        }
    }
    return dp[dp.count-1].max()!
}
