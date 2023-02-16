//
//  sequence.swift
//  wifi
//
//  Created by 서보경 on 2023/02/16.
//

import Foundation

// MARK: - 2559. 수열, 성공
// https://www.acmicpc.net/problem/2559

func sequence() {
    let counts = readLine()!.components(separatedBy: " ").map { Int($0)! } // 10 2
    let weathers = readLine()!.components(separatedBy: " ").map { Int($0)! }

    var acc: [Int] = []
    for item in weathers {
        acc.append((acc.last ?? 0) + item)
    }

    var kAcc: [Int] = []
    for i in counts[1] - 1 ..< acc.count {
        let sub = i - counts[1] < 0 ? 0 : acc[i - counts[1]]
        kAcc.append(acc[i] - sub)
    }

    print(kAcc.max()!)
}
