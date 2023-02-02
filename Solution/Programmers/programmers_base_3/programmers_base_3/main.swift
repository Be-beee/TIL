//
//  main.swift
//  programmers_base_3
//
//  Created by 서보경 on 2020/10/12.
//

import Foundation

// MARK: - 3진법 뒤집기
// https://programmers.co.kr/learn/courses/30/lessons/68935?language=swift

func solution(_ n:Int) -> Int {
    var num = n
    var ans = 0
    var str = ""
    var base = 1
    while num > 0 {
        str.append(String(num%3))
        num /= 3
    }
    let reversed:[Character] = str.reversed()
    print(reversed)
    for i in reversed {
        let k = Int(String(i)) ?? 0
        print("\(k) \(base)")
        if k != 0 {
            ans += (k*base)
        }
        base *= 3
        
        
    }
    
    return ans
}
