//
//  main.swift
//  hideandseek_1697
//
//  Created by 서보경 on 2020/10/23.
//

import Foundation

// MARK: - 1697 숨바꼭질
// https://www.acmicpc.net/problem/1697

let positions = readLine()!.split(separator: " ").map{ Int(String($0))! }

if positions[0] == positions[1] {
    print(0)
} else {
    var map = Array(repeating: 0, count: 100001)
    let dx = [ -1, 1, 2 ]
    var queue: [Int] = [positions[0]]
    while !queue.isEmpty || map[positions[1]] == 0 {
        let cur = queue[0]
        queue.removeFirst(1)
        var next = cur
        for i in 0 ..< 3 {
            if i != 2 {
                next = cur + dx[i]
            } else {
                next = cur * dx[i]
            }
            if next < 0 || next > 100000 {
                continue
            }
            if map[next] != 0 {
                continue
            } else {
                map[next] = map[cur] + 1
                queue.append(next)
            }
        }
    }
    print(map[positions[1]])
}
