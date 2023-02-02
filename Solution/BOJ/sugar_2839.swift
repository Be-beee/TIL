//
//  main.swift
//  sugar_2839
//
//  Created by 서보경 on 2020/12/14.
//

import Foundation

// MARK:- 2839 설탕 배달
// https://www.acmicpc.net/problem/2839


let sugar = Int(readLine()!)!
var minTotal = 5000

for i in 0 ..< sugar/3+1 {
    if (sugar - 3*i) % 5 != 0 {
        continue
    }
    let j = (sugar - 3*i) / 5
    
    if minTotal > i+j {
        minTotal = i+j
    }
}
if minTotal != 5000 {
    print(minTotal)
} else {
    print(-1)
}

