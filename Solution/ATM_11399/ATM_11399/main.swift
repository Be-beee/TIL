//
//  main.swift
//  ATM_11399
//
//  Created by 서보경 on 2020/11/04.
//

import Foundation

// MARK: - 11399 ATM
// https://www.acmicpc.net/problem/11399

readLine()
var lines = readLine()!.split(separator: " ").map{ Int(String($0))! }
lines.sort()
var total = 0

for i in lines.indices {
    for j in 0 ... i {
        total += lines[j]
    }
}
print(total)
