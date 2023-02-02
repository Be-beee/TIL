//
//  main.swift
//  triangle_1932
//
//  Created by 서보경 on 2020/10/29.
//

import Foundation

// MARK: - 1932 정수 삼각형

let n = Int(readLine()!)!
var triangle: [[Int]] = []
for _ in 0 ..< n {
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    triangle.append(arr)
}

var dict: [[Int]] = []

for i in 0 ..< n {
    let arr = Array(repeating: 0, count: i+1)
    dict.append(arr)
}
dict[0][0] = triangle[0][0]

for i in 1 ..< n {
    for j in 0 ..< i+1 {
        var route1 = 0
        var route2 = 0
        if j <= triangle[i-1].count-1 {
            route1 = dict[i-1][j]
        }
        if j-1 >= 0 {
            route2 = dict[i-1][j-1]
        }
        
        dict[i][j] = triangle[i][j] + max(route1, route2)
    }
}
print(dict[n-1].max()!)
