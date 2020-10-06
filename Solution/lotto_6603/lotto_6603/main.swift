//
//  main.swift
//  lotto_6603
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 6603 로또
// https://www.acmicpc.net/problem/6603

func combination (result: [Int], n: Int, r: Int, index: Int, target: Int, _ arr: [Int]) {
    if r == 0 {
        for i in 0 ..< index {
            print("\(arr[result[i]])", terminator: " ")
        }
        print()
    } else if target == n {
        return;
    } else {
        var resTmp = result
        resTmp[index] = target
        combination(result: resTmp, n: n, r: r-1, index: index+1, target: target+1, arr)
        combination(result: resTmp, n: n, r: r, index: index, target: target+1, arr)
    }
}

var inputs: [String] = []
while let input = readLine() {
    inputs.append(input)
    if input == "0" {
        break
    }
}

for item in inputs {
    var arr = item.components(separatedBy: " ").map{ Int($0) ?? 0 }
    let size = arr.removeFirst()
    let answer = Array(repeating: 0, count: size)
    combination(result: answer, n: size, r: 6, index: 0, target: 0, arr)
    print()
}
