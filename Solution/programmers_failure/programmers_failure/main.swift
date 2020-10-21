//
//  main.swift
//  programmers_failure
//
//  Created by 서보경 on 2020/10/21.
//

import Foundation

// MARK: - 실패율
// https://programmers.co.kr/learn/courses/30/lessons/42889

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var people = Array(repeating: 0, count: N+1)
    var num = stages.count
    for i in stages {
        if i < people.count {
            people[i] += 1
        }
    }
    var failure: [(stage: Int, fail: Double)] = []
    for (i, v) in people.enumerated() {
        if i > 0 {
            failure.append((i, Double(v) / Double(num)))
            num -= v
        }
    }
    failure.sort(by: { $0.fail < $1.fail })
    var result: [Int] = []
    for item in failure {
        result.append(item.stage)
    }
    return result
}
