//
//  wifi.swift
//  wifi
//
//  Created by 서보경 on 2023/02/12.
//

import Foundation

// MARK: - 공유기 설치, 시간초과 -> 성공. max(target, mid) 제거
// https://www.acmicpc.net/problem/2110

func wifi() {
    func getWifiCount(_ distance: Int, houses: [Int]) -> Int {
        var count = 1
        var prev = houses[0]
        
        for i in 1 ..< houses.count {
            if (houses[i] - prev) >= distance {
                count += 1
                prev = houses[i]
            }
        }
        return count
    }

    let input1 = readLine()!.components(separatedBy: " ").map{ Int($0)! }

    var houses: [Int] = []
    for _ in 0 ..< input1[0] {
        let input = Int(readLine()!)!
        houses.append(input)
    }
    houses.sort()
    
    var start = 1
    var end = houses[input1[0] - 1] - houses[0]

    // 2. 이분탐색
    while start <= end {
        let mid = (start + end) / 2
        let num = getWifiCount(mid, houses: houses)
        if num < input1[1] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }

    print(start - 1)
}
