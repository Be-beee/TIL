//
//  main.swift
//  programmers_matrix_multification
//
//  Created by 서보경 on 2021/12/06.
//

// MARK: - 프로그래머스: 행렬의 곱셈
// https://programmers.co.kr/learn/courses/30/lessons/12949?language=swift

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let arr1Xcnt = arr1.count
    let arr1Ycnt = arr1[0].count
    let arr2Ycnt = arr2[0].count
    var result = Array(repeating: Array(repeating: 0, count: arr2Ycnt), count: arr1Xcnt)
    
    for i in 0 ..< arr1Xcnt {
        for k in 0 ..< arr2Ycnt {
            var cal = 0
            for j in 0 ..< arr1Ycnt {
                cal += arr1[i][j] * arr2[j][k]
            }
            result[i][k] = cal
        }
    }
    return result
}
