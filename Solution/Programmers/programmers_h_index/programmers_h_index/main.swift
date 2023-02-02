//
//  main.swift
//  programmers_h_index
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK:- H-Index
// https://programmers.co.kr/learn/courses/30/lessons/42747

func solution(_ citations:[Int]) -> Int {
    var answer = 0
    for i in 0 ..< citations.count {
        let tmp = citations.filter{ $0 >= (i+1) }
        if tmp.count >= (i+1) {
            answer = i+1
        }
    }
    
    return answer
}
