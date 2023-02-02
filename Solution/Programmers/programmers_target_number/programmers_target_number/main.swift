//
//  main.swift
//  programmers_target_number
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 타겟 넘버
// https://programmers.co.kr/learn/courses/30/lessons/43165
func dfs(_ prev: Int, _ index: Int, _ numbers: [Int], _ target: Int) -> Int {
    if numbers.count <= index {
        if target == prev {
            return 1
        }
        return 0
    }
    
    let cur1 = prev + numbers[index]
    let cur2 = prev - numbers[index]
    
    var ans = 0
    ans += dfs(cur1, index+1, numbers, target)
    ans += dfs(cur2, index+1, numbers, target)
    
    return ans
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let current = numbers[0]
    var answer = 0
    answer += dfs(current, 1, numbers, target)
    answer += dfs(-current, 1, numbers, target)
    
    return answer
}
