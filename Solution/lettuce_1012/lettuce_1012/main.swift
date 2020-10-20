//
//  main.swift
//  lettuce_1012
//
//  Created by 서보경 on 2020/10/20.
//

import Foundation

// MARK: - 유기농 배추

let test_case = Int(readLine()!)!

for _ in 0 ..< test_case {
    let MNK = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var graph = Array(repeating: Array(repeating: 0, count: MNK[1]), count: MNK[0])
    var answer = 0
    for _ in 0 ..< MNK[2] {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph[input[0]][input[1]] = 1
    }

    func lettuce(_ x: Int, _ y: Int) -> Bool {
        let n = graph.count;
        let m = graph[0].count;
        
        if x <= -1 || x >= n || y <= -1 || y >= m {
            return false
        }
        if graph[x][y] == 1 {
            graph[x][y] = 0
            lettuce(x-1, y)
            lettuce(x+1, y)
            lettuce(x, y-1)
            lettuce(x, y+1)
            return true
        }
        return false
    }

    for i in graph.indices {
        for j in graph[i].indices {
            if lettuce(i, j) {
                answer += 1
            }
        }
    }
    print(answer)

}
