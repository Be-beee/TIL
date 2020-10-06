//
//  main.swift
//  average_4344
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 4344 평균은 넘겠지
// https://www.acmicpc.net/problem/4344

let cases = Int(readLine()!)!
var answers: [Double] = Array(repeating: 0, count: cases)
var casesArray = Array(repeating: "", count: cases)
for i in 0 ..< cases {
    let scores = readLine()
    if let scores = scores {
        casesArray[i] = scores
    }
}
for k in 0 ..< casesArray.count {
    var tmpArray = casesArray[k].components(separatedBy: " ").map{ Int($0)! }
    let tmpSize = Double(tmpArray.removeFirst())
    var avg: Double = 0
    var students = 0
    for i in tmpArray {
        avg += Double(i)
    }
    avg = floor(avg/tmpSize)
    for j in tmpArray {
        if Double(j) > avg {
            students += 1
        }
    }
    answers[k] = Double(students)/tmpSize * 100
    answers[k] = round(answers[k] * 1000) / 1000
    print(String(format: "%.3f",  answers[k])+"%")
}
