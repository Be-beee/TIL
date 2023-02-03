//
//  main.swift
//  programmers_select_two
//
//  Created by 서보경 on 2020/10/09.
//

import Foundation

// MARK: - 두 개 뽑아서 더하기
// https://programmers.co.kr/learn/courses/30/lessons/68644

func solution(_ numbers:[Int]) -> [Int] {
    var i = 0
    var resSet: Set<Int> = []
    while i < numbers.count {
        for j in numbers.indices {
            if i != j {
                resSet.insert(numbers[i] + numbers[j])
            }
        }
        i += 1
    }
    return Array(resSet).sorted()
}
