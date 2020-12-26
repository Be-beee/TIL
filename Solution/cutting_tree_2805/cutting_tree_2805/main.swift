//
//  main.swift
//  cutting_tree_2805
//
//  Created by 서보경 on 2020/12/26.
//

//import Foundation

// MARK: - 2805 나무 자르기
// https://www.acmicpc.net/problem/2805

func search(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    var start = start
    var end = end
    while start <= end {
        let mid = (start+end)/2
        let num = takeTree(arr, mid)
        if num >= target {
            start = mid+1
        } else {
            end = mid-1
        }
    }
    return end
}

func takeTree(_ arr: [Int], _ mid: Int) -> Int {
    var result = 0
    for item in arr {
        let meter = item - mid
        if meter > 0 {
            result += meter
        }
    }
    return result
}

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var lines = readLine()!.split(separator: " ").map{ Int(String($0))! }

let maxLine = lines.max()!

let answer = search(lines, NM[1], 1, maxLine)
print(answer)
