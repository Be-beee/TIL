//
//  main.swift
//  virus_2606
//
//  Created by 서보경 on 2021/09/04.
//

import Foundation

let node = Int(readLine()!)!
var visited = Array(repeating: false, count: node+1)

let lines = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: node+1)

var result: [Int] = []

for _ in 0 ..< lines {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[line[0]].append(line[1])
    graph[line[1]].append(line[0])
    
//    graph[line[0]].sort()
//    graph[line[1]].sort()
}

dfs(graph, 1)
print(result.count-1)

// dfs
func dfs(_ graph: [[Int]], _ start: Int) {
    visited[start] = true
    result.append(start)
    
    for i in graph[start] {
        if !visited[i] {
            dfs(graph, i)
        }
    }
}
