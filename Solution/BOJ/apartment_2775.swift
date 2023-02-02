//
//  main.swift
//  apartment_2775
//
//  Created by 서보경 on 2020/10/23.
//

import Foundation

func family(_ floor: Int, _ post: Int) -> Int {
    if floor == 0 {
        return post
    }
    var result = 0
    for i in 1 ... post {
        result += family(floor-1, i)
    }
    return result
}

let testcase = Int(readLine()!)!

for _ in 0 ..< testcase {
    let f = Int(readLine()!)!
    let p = Int(readLine()!)!
    print(family(f, p))
}
