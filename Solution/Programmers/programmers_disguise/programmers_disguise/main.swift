//
//  main.swift
//  programmers_disguise
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK:- 해시/위장
// https://programmers.co.kr/learn/courses/30/lessons/42578?language=swift

func solution(_ clothes:[[String]]) -> Int {
    var kinds: [String: Int] = [:]
    var answer = 1
    for index in clothes.indices {
        let value = kinds[clothes[index][1], default: 0]
        kinds.updateValue(value+1, forKey: clothes[index][1])
    }
    for e in kinds {
        answer *= (e.value + 1)
    }
    return answer - 1
}
