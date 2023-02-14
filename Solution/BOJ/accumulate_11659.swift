//
//  accumulate.swift
//  wifi
//
//  Created by 서보경 on 2023/02/14.
//

// MARK: - 11659. 구간 합 구하기 4
// https://www.acmicpc.net/problem/11659


import Foundation

func accumulate() {
    let counts = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    var sums: [Int] = []
    
    for item in arr {
        sums.append((sums.last ?? 0) + item)
    }

    for _ in 0 ..< counts[1] {
        let index = readLine()!.components(separatedBy: " ").map { Int($0)! }
        let start = sums[index[1]-1]
        let end = index[0]-2 < 0 ? 0 : sums[index[0]-2]
        print(start - end)
    }
}
