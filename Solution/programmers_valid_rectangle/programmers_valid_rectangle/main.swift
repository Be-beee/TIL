//
//  main.swift
//  programmers_valid_rectangle
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 멀쩡한 사각형
// https://programmers.co.kr/learn/courses/30/lessons/62048

func gcd(_ a: Int, _ b: Int) -> Int{
    var a = a
    var b = b
    while b != 0 {
        let r = a % b
        a = b
        b = r
    }
    return a
}

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer = Int64(w)
    answer *= Int64(h)
    let minus = w + h - gcd(w, h)
    
    answer -= Int64(minus)
    return answer
}
