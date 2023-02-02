//
//  main.swift
//  Bulk_7568
//
//  Created by 서보경 on 2021/04/04.
//

import Foundation

// MARK:- 7568 덩치
// https://www.acmicpc.net/problem/7568

let n = Int(readLine()!)!
var items: [(Int, Int)] = []

for _ in 0 ..< n {
    let tmp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let new = (tmp[0], tmp[1])
    items.append(new)
}
var answers: [Int] = Array(repeating: 0, count: items.count)

for i in items.indices {
    var people = 1
    for j in items.indices {
        if i != j {
            if items[i].0 < items[j].0, items[i].1 < items[j].1 {
                people += 1
            }
        }
    }
    answers[i] = people
}

var result = ""
for item in answers {
    result += "\(item) "
}

print(result)
