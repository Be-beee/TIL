//
//  main.swift
//  programmers_compression
//
//  Created by 서보경 on 2021/11/22.
//

// 프로그래머스: 압축
// https://programmers.co.kr/learn/courses/30/lessons/17684?language=swift

import Foundation

func solution(_ msg:String) -> [Int] {
    var result: [Int] = []
    var curDictMax = 26
    // 초기 사전 구성
    var dict: [String: Int] = [:]
    for i in 1 ..< curDictMax+1 {
        let calculatedAscii = Character("A").asciiValue! + UInt8(i-1)
        let newKey = UnicodeScalar(calculatedAscii).description
        dict[newKey] = i
    }
    
    let msgArr = Array(msg).map{ String($0) }
    var i = 0
    while i < msgArr.count {
        var base = msgArr[i]
        var index = 0
        var j = i+1
        var jcnt = 0
        while let hasNum = dict[base] {
            index = hasNum
            jcnt += 1
            if j < msgArr.count {
                base += msgArr[j]
                j += 1
            } else { break }
        }
        
        if i == msgArr.count-2 {
            print(jcnt)
        }
        if index != 0 {
            curDictMax += 1
            dict[base] = curDictMax
            result.append(index)
        }
        i += jcnt
    }
    return result
}
