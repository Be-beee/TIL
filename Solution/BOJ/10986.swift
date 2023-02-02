//
//  main.swift
//  10986: 나머지 합
//
//  Created by 서보경 on 2023/02/02.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }

var acc: [Int] = []
var sum = 0
for i in input.indices {
    sum += input[i]
    acc.append(sum % nm[1])
}

var mods: [Int] = Array(repeating: 0, count: nm[1])
for i in acc.indices {
    mods[acc[i]] += 1
}

var answer = mods[0]
for mod in mods {
    answer += mod * (mod - 1) / 2
}

print(answer)
