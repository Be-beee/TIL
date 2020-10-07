//
//  main.swift
//  programmers_training_clothes
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 체육복
// https://programmers.co.kr/learn/courses/30/lessons/42862?language=swift

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostVar = lost
    var reserveVar = reserve
    var answer = n - lost.count

    
    for item in reserveVar {
        if lostVar.contains(item) {
            lostVar = lostVar.filter{ $0 != item }
            reserveVar = reserveVar.filter{ $0 != item }
            answer += 1
        }
    }

    for item in reserveVar {
        if lostVar.contains(item-1) {
            lostVar = lostVar.filter{ $0 != (item-1) }
            answer += 1
        } else if lostVar.contains(item+1) {
            lostVar = lostVar.filter{ $0 != (item+1) }
            answer += 1
        }
    }
    
    return answer
}
