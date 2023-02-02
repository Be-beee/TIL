//
//  main.swift
//  bertrand_4948
//
//  Created by 서보경 on 2020/12/23.
//

//import Foundation

// MARK: - 4948 베르트랑 공준
// https://www.acmicpc.net/problem/4948
// 소수 구하기 - 에라토스테네스의 체

var data = Array(repeating: true, count: 246913)
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

while let inputData = readLine() {
    guard let input = Int(inputData) else { break }
    if input == 0 {
        break
    }
    var total = 0
    for i in input+1 ... 2*input {
        if data[i] { total += 1 }
    }
    print(total)
}
