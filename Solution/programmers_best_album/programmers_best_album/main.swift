//
//  main.swift
//  programmers_best_album
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 베스트 앨범
// https://programmers.co.kr/learn/courses/30/lessons/42579

struct PriorityQ {
    var items:[(index: Int, play: Int)] = []
    
    mutating func offer(item: (Int, Int)) {
        items.append(item)
        items.sort { $0.play > $1.play }
    }
    mutating func poll() -> (Int, Int)? {
        return items.removeFirst()
    }
    func peek() -> (Int, Int)? {
        return items.first
    }
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic: [String: Int] = [:]
    for i in genres.indices {
        let value = dic[genres[i], default: 0] + plays[i]
        dic.updateValue(value, forKey: genres[i])
    }
    let hash = dic.sorted { $0.1 > $1.1 }

    var hashes: [String: Int] = [:]
    var data: [PriorityQ] = []
    var result: [Int] = []

    for i in hash.indices {
        hashes.updateValue(i, forKey: hash[i].key)
    }

    for _ in hashes.indices {
        data.append(PriorityQ()) //data 초기화
    }

    for i in genres.indices {
        let num = hashes[genres[i]] ?? hashes.count // 고유번호 가져오기
        if num < genres.count {
            data[num].offer(item: (i, plays[i]))
        }
    }

    for i in data.indices {
        let cnt = data[i].items.count
        let item = cnt > 1 ? data[i].items[0...1].map{ $0.index } : [data[i].items[0].index]
        // let item = data[i].items[0...1].map{ $0.index }
        result.append(contentsOf: item)
    }
    
    return result
}
