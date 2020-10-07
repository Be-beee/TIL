//
//  main.swift
//  programmers_skill_tree
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK:- 스킬트리
// https://programmers.co.kr/learn/courses/30/lessons/49993

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0

    let arr = skill.map{ $0.description }
    for str in skill_trees {
        var mainSkill: [String] = []
        var hit = true
        for c in str {
            if skill.contains(c.description) {
                mainSkill.append(c.description)
            }
        }
        for t in mainSkill.indices {
            if mainSkill[t] != arr[t] {
                hit = false
                break
            }
        }
        if hit || mainSkill.count == 0 {
            // print(str)
            answer += 1
        }
    }
    return answer
}
