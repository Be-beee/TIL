//
//  main.swift
//  programmers_network
//
//  Created by 서보경 on 2021/11/24.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var connected: [[Int]] = Array(repeating: [], count: n)
    var networkNum = 0
    
    for i in computers.indices {
        for j in computers[i].indices {
            if computers[i][j] == 0 { continue }
            if i == j { continue }
            connected[i].append(j)
        }
    }
    for (i, nodes) in connected.enumerated() {
        if nodes.count == 0 {
            visited[i] = true
            networkNum += 1
        }
    }
    
    for i in visited.indices {
        if visited[i] == false {
            let start = i
            var queue: [Int] = [start]
            visited[start] = true
            
            while !queue.isEmpty {
                let v = queue.removeFirst()
                
                for i in connected[v] {
                    if !visited[i] {
                        queue.append(i)
                        visited[i] = true
                    }
                }
            }
            networkNum += 1
        } else { continue }
    }
    
    
    return networkNum
}
