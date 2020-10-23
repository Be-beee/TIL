//
//  main.swift
//  Cutting_Line_1654
//
//  Created by 서보경 on 2020/10/22.
//

import Foundation

// MARK: - 1654 랜선 자르기

func search(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    var start = start
    var end = end
    while start <= end {
        let mid = (start+end)/2
        let num = numberOfLines(arr, mid)
        if num >= target {
            start = mid+1
        } else {
            end = mid-1
        }
    }
    return end
}

func numberOfLines(_ arr: [Int], _ mid: Int) -> Int {
    var result = 0
    for item in arr {
        result += item/mid
    }
    return result
}

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var lines = Array(repeating: 0, count: NM[0])

for i in 0 ..< NM[0] {
    let line = Int(readLine()!)!
    lines[i] = line
}

let maxLine = lines.max()!

let answer = search(lines, NM[1], 1, maxLine)
print(answer)
