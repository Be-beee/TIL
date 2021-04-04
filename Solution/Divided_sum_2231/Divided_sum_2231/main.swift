//
//  main.swift
//  Divided_sum_2231
//
//  Created by 서보경 on 2021/04/04.
//

//import Foundation

// MARK:- 2231 분해합
// https://www.acmicpc.net/problem/2231

let input = Int(readLine()!)!
var answer = 0

for i in 0 ..< input {
    var sum = i
    let str = Array("\(i)")
    for item in str {
        sum += Int(String(item)) ?? 0
    }
    
    if sum == input {
        answer = i
        break
    }
}

print(answer)
