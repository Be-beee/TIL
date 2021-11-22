//
//  main.swift
//  programmers_visited_distance
//
//  Created by 서보경 on 2021/11/22.
//

// 프로그래머스: 방문 길이
// https://programmers.co.kr/learn/courses/30/lessons/49994?language=swift


import Foundation

func solution(_ dirs:String) -> Int {
    var cur = [0, 0]
    var history: [[Int]] = []
    let move = [
        "U": [0, 1],
        "D": [0, -1],
        "L": [-1, 0],
        "R": [1, 0]
    ]
    
    for act in dirs {
        let next = [cur[0] + move[String(act)]![0], cur[1] + move[String(act)]![1]]
        if next[0] < -5 || next[0] > 5 || next[1] < -5 || next[1] > 5 { continue }
        var line1 = cur
        line1.append(contentsOf: next)
        
        var line2 = cur
        line2.insert(contentsOf: next, at: 0)
        
        cur = next
        if history.contains(line1) || history.contains(line2) { continue }
        history.append(line1)
        
    }
    
    return history.count
}
