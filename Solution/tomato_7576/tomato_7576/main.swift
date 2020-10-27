//
//  main.swift
//  tomato_7576
//
//  Created by 서보경 on 2020/10/20.
//

import Foundation

// MARK: - 7576 토마토
// https://www.acmicpc.net/problem/7576

let dx = [ -1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var tomatos: [[Int]] = []
var spread = false
var max = 0
var queue: [(x: Int, y: Int)] = []

for _ in 0 ..< NM[1] {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    tomatos.append(input)
    for i in input.indices {
        if input[i] == 1 {
            queue.append((x: tomatos.count-1, y: i))
        }
    }
}
var curIdx = 0

while curIdx < queue.count {
    let cur = queue[curIdx]
    curIdx += 1
    for i in 0 ..< 4 {
        let next = (x: cur.x + dx[i], y: cur.y + dy[i])
        if(next.x < 0 || next.y < 0 || next.x >= NM[1] || next.y >= NM[0]) {
            continue
        }
        if(tomatos[next.x][next.y] != 0) {
            continue
        }
        if(tomatos[next.x][next.y] == 0) {
            tomatos[next.x][next.y] = tomatos[cur.x][cur.y] + 1 // visited
            if tomatos[next.x][next.y] > max {
                max = tomatos[next.x][next.y]
            }
            queue.append(next)
            spread = true
        }

    }
}

if spread {
    if tomatos.contains(where: { $0.contains(0) }) {
        print(-1)
    } else {
        print(max-1)
    }
} else {
    print(0)
}
