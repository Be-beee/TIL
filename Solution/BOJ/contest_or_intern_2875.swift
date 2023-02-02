//
//  main.swift
//  contest_or_intern_2875
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 2875 대회 or 인턴
// https://www.acmicpc.net/problem/2875

let input = readLine() ?? ""
let info = input.components(separatedBy: " ").map{ Int($0)! }
let N = info[0]
let M = info[1]
let K = info[2]
var i = M
while i >= 0 {
    if 2*i <= N && 3*i+K <= N+M{
        break
    }
    i -= 1
}
print(i)
