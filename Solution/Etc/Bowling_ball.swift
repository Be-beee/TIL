//
//  main.swift
//  Bowling_ball
//
//  Created by 서보경 on 2020/10/18.
//

// MARK: - [이것이 코딩테스트다: 기출 풀이] 볼링공 고르기

import Foundation

let NM = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let bowling_balls = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var res = 0

for i in 0 ..< bowling_balls.count - 1 {
    for j in i+1 ..< bowling_balls.count {
        if bowling_balls[i] == bowling_balls[j] {
            continue
        } else {
            res += 1
        }
    }
}

print(res)
