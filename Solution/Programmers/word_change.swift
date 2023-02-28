//
//  main.swift
//  programmers_visited_distance
//
//  Created by 서보경 on 2023/02/28.
//

// 프로그래머스: 단어 변환
// https://school.programmers.co.kr/learn/courses/30/lessons/43163?language=swift#


import Foundation

func canChange(from word: String, to target: String) -> Bool {
    let wordArr = Array(word)
    let targetArr = Array(target)
    
    var count = 0
    for i in wordArr.indices {
        if wordArr[i] != targetArr[i] { count += 1 }
        if count > 1 { return false }
    }
    return true
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // BFS를 사용해서 최소 변환 수를 구함
    // hit -> hot
    // hot -> dot, lot
    // dot -> dog / lot -> log
    // dog -> cog / log -> cog
    
    
    if !words.contains(target) { return 0 }
    
    var visited: [String: Bool] = [:]
    for word in words {
        visited.updateValue(false, forKey: word)
    }

    var queue: [(String, Int)] = [(begin, 0)] // (word, depth)의 구성
    var answers: [Int] = []
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        if current.0 == target {
            answers.append(current.1) // 헤맨 부분. 처음엔 단순히 depth가 제일 큰 값만 뽑아내면 된다고 생각했다.
        }
        for word in words {
            if !visited[word]!, canChange(from: current.0, to: word) {
                queue.append((word, current.1 + 1))
                visited.updateValue(true, forKey: word)
            }
        }
        visited.updateValue(true, forKey: current.0)
    }
    
    return answers.min()!
}
