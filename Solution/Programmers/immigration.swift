//
//  main.swift
//  immigration
//
//  Created by 서보경 on 2023/03/02.
//

// 프로그래머스: 입국심사
// https://school.programmers.co.kr/learn/courses/30/lessons/43238?language=swift


import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start: Int64 = 1
    var end: Int64 = Int64(times.max()!) * Int64(n)
    let mid = (start + end) / Int64(2)
    while start <= end {
        let mid = (start + end) / Int64(2)
        let completed = times.map({ mid / Int64($0) }).reduce(0) { $0 + $1 }
        if completed >= n {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return start
}
