//
//  main.swift
//  Floyd_Warshall
//
//  Created by 서보경 on 2021/04/11.
//

import Foundation

// MARK:- 플로이드 워셜 알고리즘
// 모든 지점에서 다른 모든 지점까지의 최단 경로를 모두 구해야하는 경우
// 시간복잡도 O(n^3)

let node = Int(readLine()!)!
let bus = Int(readLine()!)!
let INF = 987654321
var graph = Array(repeating: Array(repeating: INF, count: node+1), count: node+1)

for i in 1 ..< node+1 {
    for j in 1 ..< node+1 {
        if i == j {
            graph[i][j] = 0
        }
    }
}

for _ in 0 ..< bus {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let a = input[0]
    let b = input[1]
    let cost = input[2]
    
    graph[a][b] = cost
}

for k in 1 ..< node+1 {
    for i in 1 ..< node+1 {
        for j in 1 ..< node+1 {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

for i in 1 ..< node+1 {
    for j in 1 ..< node+1 {
        if graph[i][j] == INF {
            print("INFINITY", terminator: " ")
        } else {
            print(graph[i][j], terminator: " ")
        }
    }
    print()
}


