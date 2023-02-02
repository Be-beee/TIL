//
//  main.swift
//  goldbach_9020
//
//  Created by 서보경 on 2020/12/28.
//

import Foundation

// MARK: - 9020 골드바흐의 추측
// https://www.acmicpc.net/problem/9020

var data = Array(repeating: true, count: 10001)
data[0] = false
data[1] = false

for i in 2 ..< data.count {
    if !data[i] { continue }
    
    var idx = 2*i
    while idx < data.count {
        data[idx] = false
        idx += i
    }
}

var primes: [Int] = []

for idx in data.indices {
    if data[idx] {
        primes.append(idx)
    }
}

let test_case = Int(readLine()!)!

for _ in 0 ..< test_case {
    let input = Int(readLine()!)!
    
    var answer: (Int, Int) = (0, 0)
    for one in 0 ..< primes.count {
        if primes[one] > input/2 {
            break
        }
        for two in one ..< primes.count {
            if (primes[one] + primes[two]) == input {
                answer = (primes[one], primes[two])
                break
            }
        }
    }
    print("\(answer.0) \(answer.1)")
}

