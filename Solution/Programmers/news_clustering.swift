//
//  main.swift
//  programmers_news_clustering
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 뉴스 클러스터링
// https://programmers.co.kr/learn/courses/30/lessons/17677?language=swift


func solution(_ str1:String, _ str2:String) -> Int {
    var set1: [String] = []
    var set2: [String] = []
    var res = 65536.0
    
    for index in 0 ..< str1.count - 1 {
        let item = String(str1[str1.index(str1.startIndex, offsetBy: index)]) + String(str1[str1.index(str1.startIndex, offsetBy: index + 1)])
        if !item.contains(where: { !$0.isLetter }){
            set1.append(item.uppercased())
        }
    }
    
    for index in 0 ..< str2.count - 1 {
        let item = String(str2[str2.index(str2.startIndex, offsetBy: index)]) + String(str2[str2.index(str2.startIndex, offsetBy: index + 1)])
        if !item.contains(where: { !$0.isLetter }) {
            set2.append(item.uppercased())
        }
    }
    
    var intersection: [String] = []
    var union: [String] = []
    if set1.count < set2.count {
        for item in set1 {
            for index in set2.indices {
                if item == set2[index] {
                    intersection.append(item)
                    set2.remove(at: index)
                    break
                }
            }
        }
    } else {
        for item in set2 {
            for index in set1.indices {
                if item == set1[index] {
                    intersection.append(item)
                    set1.remove(at: index)
                    break
                }
            }
        }
    }
    union.append(contentsOf: set1 + set2)
    
    if set1.count == 0, set2.count == 0 {
        res *= 1.0
    } else {
        res *= Double(intersection.count)/Double(union.count)
    }
    return Int(res)
}
