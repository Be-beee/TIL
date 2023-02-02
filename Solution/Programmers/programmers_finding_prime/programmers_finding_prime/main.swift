//
//  main.swift
//  programmers_finding_prime
//
//  Created by 서보경 on 2020/10/12.
//

import Foundation

// MARK: - 소수 찾기
// https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
// 오답ㅠㅠ

var memo: Set<Int> = []
var select: [Bool] = Array(repeating: false, count: 10)
var answer = 0

func isPrime(_ number: Int) -> Bool {
    if number == 0 || number == 1 {
        return false
    }
    if number == 2 {
        return true
    }
    let sqrtNum = Int(sqrt(Double(number)))
    if sqrtNum > 2 {
        for i in 2 ..< sqrtNum {
            if number%i == 0 {
                return false
            }
        }
    } else {
        for i in 2 ..< number{
            if number%i == 0 {
                return false
            }
        }
    }
    return true
    
}

func searchingPrime(_ s: String, _ res: String) {
    let num = Int(res) ?? 0
    if !res.isEmpty && !memo.contains(num){
        memo.insert(num)
        if isPrime(num) {
            answer += 1
        }
    }
    for (i, v) in s.enumerated() {
        if select[i] {
            continue
        }
        select[i] = true
        let next = res + String(v)
        searchingPrime(s, next);
        select[i] = false
    }
}

func solution(_ numbers:String) -> Int {
    searchingPrime(numbers, "")
    return answer
}
