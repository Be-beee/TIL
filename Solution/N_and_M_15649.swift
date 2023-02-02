//
//  main.swift
//  N_and_M_15649
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 15649 N과 M
// https://www.acmicpc.net/problem/15649

func recursive(_ res: [Int], _ n: Int) {
    var res = res
    if res.count == n {
        var str = ""
        for item in res {
            str += "\(item) "
        }
        str.removeLast()
        print(str)
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
