//
//  main.swift
//  prime_2581
//
//  Created by 서보경 on 2020/11/04.
//

import Foundation

// MARK: - 2581 소수 찾기
// https://www.acmicpc.net/problem/2581

func check(_ num: Int) -> Bool {
    if num == 1 {
        return false
    }
    let tmp = sqrt(Double(num))
    for j in 1 ... Int(tmp) {
        if num % j == 0, j != 1 {
            return false
        }
    }
    return true
}

var min = Int(readLine()!)!
let max = Int(readLine()!)!
var minPrime = max
var total = 0

for i in min ... max {
    let isPrime = check(i)
    if isPrime {
        if minPrime > i {
            minPrime = i
        }
        total += i
    }
}

if total == 0 {
    print(-1)
} else {
    print(total)
    print(minPrime)
}
// 1 1, 1 2, 2 2 처리
