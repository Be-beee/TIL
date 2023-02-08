//
//  main.swift
//  AddBinary
//
//  Created by 서보경 on 2023/02/08.
//

import Foundation

// MARK: - 67. Add Binary
// https://leetcode.com/problems/add-binary/description/

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let arrA = Array(a).reversed().map{ Int(String($0))! }
        let arrB = Array(b).reversed().map{ Int(String($0))! }

        var answer: [Int] = []

        let count = arrA.count < arrB.count ? arrB.count : arrA.count
        var prev = 0
        for i in 0 ..< count {
            var digit = (arrA[safe: i] ?? 0) + (arrB[safe: i] ?? 0) + prev
            answer.append(digit % 2)
            prev = digit / 2
        }

        if prev == 1 {
            answer.append(prev)
        }
        
        return answer.reversed().map({ String($0) }).joined()
    }
}
