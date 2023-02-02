//
//  main.swift
//  alarm_clock_2884
//
//  Created by 서보경 on 2020/10/18.
//

import Foundation

// MARK: - 2884 알람시계
// https://www.acmicpc.net/problem/15552

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var minutes = 45 - input[1]
var res: [Int] = []
if minutes > 0 {
    if input[0] == 0 {
        res.append(23)
    } else {
        res.append(input[0] - 1)
    }
    res.append(60 - minutes)
} else {
    res.append(input[0])
    res.append(-1 * minutes)
}

print("\(res[0]) \(res[1])")
