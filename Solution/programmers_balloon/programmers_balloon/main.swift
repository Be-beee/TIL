//
//  main.swift
//  programmers_balloon
//
//  Created by 서보경 on 2020/10/10.
//

import Foundation

// MARK: - 풍선 터트리기
// https://programmers.co.kr/learn/courses/30/lessons/68646?language=swift
// 시간 초과..

func solution(_ a:[Int]) -> Int {
    var res = 1
    for i in a.indices {
        let left = a.startIndex ..< a.index(a.startIndex, offsetBy: i)
        let right = a.index(a.startIndex, offsetBy: i+1) ..< a.endIndex
        
        if a[left].contains(where: { $0 < a[i] }), a[right].contains(where: { $0 < a[i] }) {
            continue
        } else {
            res += 1
        }
    }
    return res
}

let arr = [-16,27,65,-2,58,-92,-71,-68,-61,-33]
let res = solution(arr)

print(res)

