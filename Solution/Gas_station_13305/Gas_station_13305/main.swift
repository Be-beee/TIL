//
//  main.swift
//  Gas_station_13305
//
//  Created by 서보경 on 2021/04/06.
//

//import Foundation

// MARK:- 13305 주유소
// https://www.acmicpc.net/problem/13305

let num = Int(readLine()!)!
let distances = readLine()!.split(separator: " ").map{ Int(String($0))! }
var costs = readLine()!.split(separator: " ").map{ Int(String($0))! }
costs.removeLast()

var result = 0
var curMin = costs[0]

for i in 0 ..< num-1 {
    if curMin > costs[i] {
        curMin = costs[i]
    }
    result += (curMin * distances[i])
}
print(result)
