//
//  main.swift
//  ps_1541
//
//  Created by 서보경 on 2020/11/04.
//

import Foundation

// MARK: - 1541 잃어버린 괄호
// https://www.acmicpc.net/problem/1541

var input = readLine()!.split(separator: "-")
let zero = input[0].split(separator: "+").map{ Int(String($0)) ?? 0 }
var total = zero.reduce(0) { $0 + $1 }
for idx in 1 ..< input.count {
    let arr: [Int] = input[idx].split(separator: "+").map{ Int(String($0)) ?? 0 }
    total -= arr.reduce(0, { $0 + $1 })
}

print(total)
