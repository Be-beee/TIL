//
//  main.swift
//  Chess_knight
//
//  Created by 서보경 on 2020/10/18.
//

import Foundation

// MARK: - [이것이 코딩테스트다] chapter 4. 실전2 왕실의 나이트

let parallel = [ "a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8 ]
let move: [(x: Int, y: Int)] = [(-1, -2), (1, -2), (-1, 2), (1, 2), (-2, -1), (-2, 1), (2, -1), (2, 1)]
let input = Array(readLine()!).map{ String($0) }
print(input)
var res = 0

let inputXY = [parallel[input[0]]!, Int(input[1])!]


for m in move {
    let nextX = inputXY[0] + m.x
    let nextY = inputXY[1] + m.y

    if nextX < 1 || nextX > 8 || nextY < 1 || nextY > 8 {
        continue
    } else {
        res += 1
    }
}

print(res)
