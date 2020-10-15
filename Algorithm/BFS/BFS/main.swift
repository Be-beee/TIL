//
//  main.swift
//  BFS
//
//  Created by 서보경 on 2020/10/15.
//

import Foundation

// MARK: - BFS, Int Graph

var visited = Array(repeating: false, count: 9)

func bfs(_ graph: [[Int]], _ start: Int) {
    var queue: [Int] = [start]
    visited[start] = true
    
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print(v, terminator: " ")
        
        for i in graph[v] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}

let graph = [
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

bfs(graph, 1)
print()

// MARK: - BFS, Generic Graph

class BFS<T: Hashable> {
    var visit: Set<T> = []
    var dict: [T: Int] = [:]
    
    init() {}
    init(dict: [T: Int]) {
        self.dict = dict
    }
    
    func bfs(_ graph: [[T]], _ start: T) {
        var queue: [T] = [start]
        visit.insert(start)
        
        while !queue.isEmpty {
            let v = queue.removeFirst()
            print(v, terminator: " ")
            
            let idx = dict[v] ?? 0
            for i in graph[idx] {
                if !visit.contains(i) {
                    queue.append(i)
                    visit.insert(i)
                }
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

var bfs = BFS<String>(dict: dict)
bfs.bfs(genericGraph, "a")

// a, b, c, d, e, f, g, h
