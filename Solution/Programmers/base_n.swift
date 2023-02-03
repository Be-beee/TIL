//
//  main.swift
//  programmers_base_n
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - N진수 게임
// https://programmers.co.kr/learn/courses/30/lessons/17687?language=swift

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var total = "0"
    let extra = ["A", "B", "C", "D", "E", "F"]

    for i in 0 ... (t * m) {
        var tmp = i
        var str = ""
        while tmp > 0 {
            if tmp%n < 10 {
                str += "\(tmp%n)"
            } else {
                //10 -> A, 11 -> B, 12 -> C, 13 -> D, 14 -> E, 15 -> F
                str += "\(extra[(tmp%n)%10])"
            }
            tmp /= n
        }
        let strReversed: [Character] = str.reversed()
        total += strReversed

    }

    var answer = ""
    var index = 0
    for (i, c) in total.enumerated() {
        if t <= index {
            break
        }
        if i % m + 1 == p {
            answer += c.description
            index += 1
        }
    }
    
    return answer
}
