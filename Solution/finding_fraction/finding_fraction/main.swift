//
//  main.swift
//  finding_fraction
//
//  Created by 서보경 on 2020/10/04.
//

import Foundation

// MARK: - 1193 분수 찾기
// https://www.acmicpc.net/problem/1193


let num = Int(readLine()!)!
var sum = 1
var n = 1
if num == 1{
    print("1/1")
} else {
    while sum < num {
        sum = n*(n+1)/2
        n += 1
    }

    let sub = sum - num
    if n % 2 == 1 {
        print("\(n-1 - sub)/\(1+sub)")
    } else {
        print("\(1+sub)/\(n-1 - sub)")
    }
    

}
