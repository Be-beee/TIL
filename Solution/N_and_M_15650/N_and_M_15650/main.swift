//
//  main.swift
//  N_and_M_15650
//
//  Created by 서보경 on 2020/12/23.
//

import Foundation

// MARK:- 15650 N과 M(2)
// https://www.acmicpc.net/problem/15650

var answer: [[Int]] = []

func recursive(_ res: [Int], _ n: Int) {
    var res = res
    if res.count == n {
        let member = res.sorted()
        if !answer.contains(member) {
            answer.append(member)
        }
        return
    }
    
    for i in 1 ... size {
        if !res.contains(i) {
            res.append(i)
            recursive(res, n)
            res.removeLast()
        }
    }
}

let input = readLine()!.components(separatedBy: " ")
let size = Int(input[0])!
let select = Int(input[1])!
var list: [Int] = []
for i in 1 ... size {
    list.append(i)
}
recursive([], select)

for item in answer {
    var str = ""
    for j in item {
        str += "\(j) "
    }
    str.removeLast()
    print(str)
}
