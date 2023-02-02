//
//  main.swift
//  dfs_bfs_1260
//
//  Created by 서보경 on 2021/09/04.
//

import Foundation

let n = readLine()!.split(separator: " ").map{ Int(String($0))! }
var graphItems: [[Int]] = Array(repeating: [], count: n[0]+1)

var dfsresult = ""
var bfsresult = ""

for _ in 0 ..< n[1] {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graphItems[line[0]].append(line[1])
    graphItems[line[1]].append(line[0])
    graphItems[line[0]].sort()
    graphItems[line[1]].sort()
}
var visited = Array(repeating: false, count: n[0]+1)
dfs(graphItems, n[2])
print(dfsresult)

visited = Array(repeating: false, count: n[0]+1)
bfs(graphItems, n[2])
print(bfsresult)


func dfs(_ graph: [[Int]], _ v: Int) {
    visited[v] = true
    dfsresult += "\(v) "
    for i in graph[v] {
        if !visited[i] {
            dfs(graph, i)
        }
    }
}

func bfs(_ graph: [[Int]], _ start: Int) {
    var queue: [Int] = [start]
    visited[start] = true
    
    while !queue.isEmpty {
        let v = queue.removeFirst()
        bfsresult += "\(v) "
        for i in graph[v] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}
