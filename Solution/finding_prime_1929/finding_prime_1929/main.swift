//
//  main.swift
//  finding_prime_1929
//
//  Created by 서보경 on 2020/10/04.
//

import Foundation

// MARK: - 1929 소수 찾기
// https://www.acmicpc.net/problem/1929


if let input = readLine(){
    let arr = input.components(separatedBy: " ").map{ Int($0)! }
    let M = arr[0]
    let N = arr[1]
    for i in M ... N {
        var isPrime = true
        if i != 1 {
            let sqrtNum = Int(floor(sqrt(Double(i))))
            var j = 2
            while j <= sqrtNum {
                if i % j == 0{
                    isPrime = false
                    break
                }
                j += 1
            }
        } else {
            isPrime = false
        }
        if isPrime {
            print(i)
        }
    }
}
