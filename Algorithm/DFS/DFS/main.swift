//
//  main.swift
//  DFS
//
//  Created by 서보경 on 2020/10/15.
//

import Foundation

// MARK: - DFS, Int graph

var visited = Array(repeating: false, count: 9)

func dfs(_ graph: [[Int]], _ v: Int) {
    visited[v] = true
    print("\(v) visited: \(visited)")
    
    for i in graph[v] {
        if !visited[i] {
            dfs(graph, i)
        }
    }
}

var graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]
dfs(graph, 1)

// MARK: - DFS, Generic Graph

class DFS<T: Hashable> {
    var visit: Set<T> = []
    var dict: [T: Int] = [:]
    
    init() {}
    init(dict: [T: Int]) {
        self.dict = dict
    }
    
    func dfs(_ graph: [[T]], _ v: T) {
        visit.insert(v)
        print("\(v) visited: \(visit)")
        
        let idx = dict[v] ?? 0
        for i in graph[idx] {
            if !visit.contains(i) {
                dfs(graph, i)
            }
        }
    }
    
}


let dict = [ "a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7 ]
let genericGraph = [
    ["b", "c"],
    ["a", "d", "e"],
    ["a", "f", "g"],
    ["b"],
    ["b", "f", "h"],
    ["e", "c", "g"],
    ["c", "f"],
    ["e"]
]

var dfs = DFS<String>(dict: dict)
dfs.dfs(genericGraph, "a")

// a, b, d, e, f, c, g, h
