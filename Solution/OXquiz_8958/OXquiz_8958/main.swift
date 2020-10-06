//
//  main.swift
//  OXquiz_8958
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 8958 OX퀴즈
// https://www.acmicpc.net/problem/8958

let input1 = Int(readLine()!)!
var tmpStr = Array(repeating: "", count: input1)

for i in 0 ..< input1 {
    let input2 = readLine()
    if let input2 = input2 {
        tmpStr[i] = input2
    }
}
for item in 0 ..< tmpStr.count {
    var hit = 0
    var total = 0
    for i in tmpStr[item] {
       if i == "O" {
        hit += 1
        total += hit
        } else {
            hit = 0
        }
    }
    print(total)
}

