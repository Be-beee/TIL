//
//  main.swift
//  programmers_tuple
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK:- 튜플
// https://programmers.co.kr/learn/courses/30/lessons/64065

func solution(_ s:String) -> [Int] {
    var str = s
    var answer: [Int] = []
    str.removeFirst()
    str.removeLast()
    var separatedTuples = str.components(separatedBy: "},")
    for index in 0 ..< separatedTuples.count {
       separatedTuples[index].removeFirst()
       if index == separatedTuples.count-1 {
           separatedTuples[index].removeLast()
       }
    }
    separatedTuples.sort { $0.count < $1.count }
    
    for item in separatedTuples {
       if item.count == 1 {
           answer.append(Int(item) ?? 0)
           continue
       }
       let tmp = item.components(separatedBy: ",").map{ Int($0) ?? 0 }
       for num in tmp {
           if !answer.contains(num) {
               answer.append(num)
               break
           }
       }
    }

    
    return answer
}
