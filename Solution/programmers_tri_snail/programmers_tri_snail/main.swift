//
//  main.swift
//  programmers_tri_snail
//
//  Created by 서보경 on 2020/10/09.
//

import Foundation

// MARK: - 삼각 달팽이
// 사각 달팽이 변형
// https://programmers.co.kr/learn/courses/30/lessons/68645

func solution(n:Int) -> [Int] {
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n+2), count: n+2)
    var i = 0
    var j = 1 // 주의!
    var c = 1
    for i in 0 ... n+1 {
        res[0][i] = 1
        res[n+1][i] = 1
        res[i][0] = 1
        res[i][n+1] = 1
    }
    
    while c <= (n)*(n+1)/2 {
        // down -> right -> up -> left
        while res[i+1][j] == 0 { // down
            i += 1
            res[i][j] = c
            c += 1
        }
        while res[i][j+1] == 0 { // right
            j += 1
            res[i][j] = c
            c += 1
        }
        while res[i-1][j-1] == 0 { // up
            i -= 1
            j -= 1
            res[i][j] = c
            c += 1
        }
    }
    
    var arr: [Int] = []
    for i in res.indices {
        for j in res.indices {
            if i != 0, j != 0, i != n+1, j != n+1, res[i][j] != 0, res[i][j] != -1 {
                arr.append(res[i][j])
            }
        }
    }
    
    return arr
}

// MARK: - 참고: 사각 달팽이

func snail(n: Int) -> [[Int]] {
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n+2), count: n+2) // 주의!
    var i = 0
    var j = 1 // 주의!
    var c = 1
    for i in 0 ... n+1 {
        res[0][i] = 1
        res[n+1][i] = 1
        res[i][0] = 1
        res[i][n+1] = 1
    }
    
    while c <= n*n {
        // down -> right -> up -> left
        while res[i+1][j] == 0 {
            i += 1
            res[i][j] = c
            c += 1
        }
        while res[i][j+1] == 0 {
            j += 1
            res[i][j] = c
            c += 1
        }
        while res[i-1][j] == 0 {
            i -= 1
            res[i][j] = c
            c += 1
        }
        while res[i][j-1] == 0 {
            j -= 1
            res[i][j] = c
            c += 1
        }
    }
    
    return res
}


let arr = solution(n: 5)
print(arr)
