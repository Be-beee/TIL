//
//  main.swift
//  zipcode_2667
//
//  Created by 서보경 on 2020/10/16.
//

import Foundation

// MARK: - 2667 단지 번호 붙이기
// https://www.acmicpc.net/problem/2667

let num = Int(readLine()!)!
var graph: [[Int]] = []
var tmp = 0
var res: [Int] = []

func zipcode(_ x: Int, _ y: Int) -> Bool {
    let n = graph.count
    
    if x <= -1 || x >= n || y <= -1 || y >= n {
        return false
    }
    
    if graph[x][y] == 1 {
        graph[x][y] = 0
        tmp += 1
        zipcode(x-1, y)
        zipcode(x, y-1)
        zipcode(x+1, y)
        zipcode(x, y+1)
        return true
    }
    
    return false
}

for _ in 0 ..< num {
    let tmpArr = Array(readLine()!).map{ Int(String($0))! }
    graph.append(tmpArr)
}

for i in 0 ..< num {
    for j in 0 ..< num {
        tmp = 0
        if(zipcode(i, j)) {
            res.append(tmp)
        }
    }
}
res.sort()

print(res.count)
for item in res {
    print(item)
}
