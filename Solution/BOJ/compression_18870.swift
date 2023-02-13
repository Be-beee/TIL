//
//  compression.swift
//  wifi
//
//  Created by 서보경 on 2023/02/13.
//

import Foundation

// MARK: - 18870: 좌표 압축
// https://www.acmicpc.net/problem/18870

func compression() {
    let _ = readLine()!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let sorted = Array(Set(arr)).sorted()

    var dict: [Int: Int] = [:]
    for (i, item) in sorted.enumerated() {
        dict.updateValue(i, forKey: item)
    }

    var answer: [Int] = []
    for item in arr {
        answer.append(dict[item]!)
    }

    print(answer.map{ String($0) }.joined(separator: " ") )
}
