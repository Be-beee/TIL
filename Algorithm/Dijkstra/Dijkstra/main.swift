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

struct SimpleDijkstra {
    let INF = 987654321
    var graph: [[(dest: Int, cost: Int)]] = []
    var visited: [Bool] = []
    var distance: [Int] = []
    init() {
        let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let n = nm[0] // 노드 개수
        let m = nm[1] // 간선 개수
        
        let start = Int(readLine()!)! // 시작 노드 번호
        
        graph = Array(repeating: [], count: n+1)
        visited = Array(repeating: false, count: n+1)
        distance = Array(repeating: INF, count: n+1)
        
        for _ in 0 ..< m {
            // a 노드 -> b 노드의 비용 c
            let intmp = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let a = intmp[0]
            let b = intmp[1]
            let c = intmp[2]
            
            graph[a].append((b, c))
        }
        
        dijkstra(start, n)
        
        for i in 1 ..< n+1 {
            if distance[i] == INF {
                print("INFINITY")
            } else {
                print(distance[i])
            }
        }
    }
    
    func getSmallestNode(_ n: Int) -> Int {
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
    
    mutating func dijkstra(_ start: Int, _ n: Int) {
        distance[start] = 0
        visited[start] = true
        for j in graph[start] {
            distance[j.dest] = j.cost
        }
        for _ in 0 ..< n-1 {
            let now = getSmallestNode(n)
            visited[now] = true
            for j in graph[now] {
                let cost = distance[now]+j.cost
                if cost < distance[j.dest] {
                    distance[j.dest] = cost
                }
            }
        }
    }
}


// MARK: - 개선된 다익스트라 알고리즘
// 힙(Heap)을 활용한 다익스트라 알고리즘, 시간 복잡도: O(ElogV)

struct New_Dijkstra {
    let INF = 9876543210
    var graph: [[(Int, Int)]] = []
    var distance: [Int] = []
    init() {
        let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let start = Int(readLine()!)!
        graph = Array(repeating: [], count: nm[0]+1)
        distance = Array(repeating: INF, count: nm[0]+1)
        for _ in 0 ..< nm[1] {
            let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
            graph[abc[0]].append((abc[1], abc[2]))
        }
        dijkstra(start)
        for i in 1 ..< nm[0]+1 {
            if distance[i] == INF {
                print("INFINITY")
            } else {
                print(distance[i])
            }
        }
        
    }
    mutating func dijkstra(_ start: Int) {
        var heap = Heap<(Int, Int)>(sort: { $0.1 < $1.1 }, items: [])
        heap.insert((0, start))
        distance[start] = 0
        
        while !heap.isEmpty {
            let min = heap.remove()!
            if distance[min.1] < min.0 {
                continue
            }
            for i in graph[min.1] {
                let cost = min.0 + i.1
                if cost < distance[i.0] {
                    distance[i.0] = cost
                    heap.insert((cost, i.0))
                }
            }
        }
        
    }
}

// MARK:- TEST

let test1 = SimpleDijkstra()
let test2 = New_Dijkstra()
