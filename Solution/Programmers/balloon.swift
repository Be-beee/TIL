//
//  main.swift
//  programmers_balloon
//
//  Created by 서보경 on 2020/10/10.
//

import Foundation

// MARK: - 풍선 터트리기
// https://programmers.co.kr/learn/courses/30/lessons/68646?language=swift

// MARK: - 첫번째 시도 (시간 초과)

//func solution(_ a:[Int]) -> Int {
//    var res = 1
//    for i in a.indices {
//        let left = a.startIndex ..< a.index(a.startIndex, offsetBy: i)
//        let right = a.index(a.startIndex, offsetBy: i+1) ..< a.endIndex
//
//        if a[left].contains(where: { $0 < a[i] }), a[right].contains(where: { $0 < a[i] }) {
//            continue
//        } else {
//            res += 1
//        }
//    }
//    return res
//}


// MARK: - 두번째 시도

func solution(_ a: [Int]) -> Int {
    var res = 0
    if a.count == 1 {
        return res
    }
    var tuples: [(index: Int, value: Int)] = []
    for (i, v) in a.enumerated() {
        tuples.append((i, v))
    }

    tuples.sort(by: { $0.value < $1.value })
    var minIdx = min(tuples[0].index, tuples[1].index)
    var maxIdx = max(tuples[0].index, tuples[1].index)
    
    for i in 2 ..< tuples.count {
        let curIdx = tuples[i].index
        if minIdx < curIdx, curIdx < maxIdx {
            continue
        }
        res += 1
        minIdx = min(minIdx, tuples[i].index)
        maxIdx = max(maxIdx, tuples[i].index)
    }

    return res+2
}

let arr = [-16,27,65,-2,58,-92,-71,-68,-61,-33]
let res = solution(arr)

print(res)

