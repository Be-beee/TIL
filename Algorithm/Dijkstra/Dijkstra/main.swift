//
//  main.swift
//  Dijkstra
//
//  Created by 서보경 on 2020/11/30.
//

import Foundation
// references: 이것이 취업을 위한 코딩테스트다 도서,(http://www.yes24.com/Product/Goods/91433923)

// MARK: - 간단한 다익스트라 알고리즘
// 리스트를 활용한 다익스트라 알고리즘, 시간 복잡도: O(V^2)

let INF = 987654321
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0] // 노드 개수
let m = nm[1] // 간선 개수

let start = Int(readLine()!)! // 시작 노드 번호

var graph: [[(dest: Int, cost: Int)]] = Array(repeating: [], count: n+1)
var visited = Array(repeating: false, count: n+1)
var distance = Array(repeating: INF, count: n+1)

for _ in 0 ..< m {
    // a 노드 -> b 노드의 비용 c
    let intmp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let a = intmp[0]
    let b = intmp[1]
    let c = intmp[2]
    
    graph[a].append((b, c))
}

func getSmallestNode() -> Int {
    var minValue = INF
    var index = 0
    
    for i in 1 ..< n+1 {
        if distance[i] < minValue, !visited[i] {
            minValue = distance[i]
            index = i
        }
    }
    return index
}

func dijkstra(_ start: Int) {
    distance[start] = 0
    visited[start] = true
    for j in graph[start] {
        distance[j.dest] = j.cost
    }
    for _ in 0 ..< n-1 {
        let now = getSmallestNode()
        visited[now] = true
        for j in graph[now] {
            let cost = distance[now]+j.cost
            if cost < distance[j.dest] {
                distance[j.dest] = cost
            }
        }
    }
}
dijkstra(start)

for i in 1 ..< n+1 {
    if distance[i] == INF {
        print("INFINITY")
    } else {
        print(distance[i])
    }
}
// MARK: - 개선된 다익스트라 알고리즘
// 힙(Heap)을 활용한 다익스트라 알고리즘, 시간 복잡도: O(ElogV)
