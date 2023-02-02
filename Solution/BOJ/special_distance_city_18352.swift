//
//  main.swift
//  special_distance_city_18352
//
//  Created by 서보경 on 2020/10/27.
//

import Foundation

// MARK: - 18352 특정 거리의 도시 찾기
// https://www.acmicpc.net/problem/18352

let NMKX = readLine()!.split(separator: " ").map{ Int(String($0))! }
var graph: [[Int]] = Array(repeating: [], count: NMKX[0]+1)
var visited: [Int] = Array(repeating: -1, count: NMKX[0]+1)

for _ in 0 ..< NMKX[1] {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]].append(input[1])
}

let start = NMKX[3]
let distance = NMKX[2]
var queue: [Int] = []
queue.append(start)
visited[start] = 0

var curIdx = 0
while curIdx < queue.count {
    let cur = queue[curIdx]
    curIdx += 1
    for next in graph[cur] {
        if visited[next] == -1 {
            queue.append(next);
            visited[next] = visited[cur] + 1
        }
    }
}

var checked = false
for i in visited.indices {
    if visited[i] == NMKX[2] {
        print(i)
        checked = true
    }
}
if !checked {
    print(-1)
}
