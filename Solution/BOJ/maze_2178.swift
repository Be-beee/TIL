//
//  main.swift
//  maze_2178
//
//  Created by 서보경 on 2020/10/20.
//

import Foundation

// MARK: - 2178 미로 탐색
// https://www.acmicpc.net/problem/2178

let dx = [ -1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var maze: [[Int]] = []

for _ in 0 ..< NM[0] {
    let input = Array(readLine()!)
    maze.append(input.map{ Int(String($0))! })
}

var queue: [(x: Int, y: Int)] = []
queue.append((0, 0))

while !queue.isEmpty {
    let cur = queue.removeFirst()
    for i in 0 ..< 4 {
        let next = (x: cur.x + dx[i], y: cur.y + dy[i])
        if(next.x < 0 || next.y < 0 || next.x >= NM[0] || next.y >= NM[1]) {
            continue
        }
        if(maze[next.x][next.y] == 0) {
            continue
        }
        if(maze[next.x][next.y] == 1) {
            maze[next.x][next.y] = maze[cur.x][cur.y] + 1;
            queue.append(next);
        }
    }
}

print(maze[NM[0]-1][NM[1]-1])
