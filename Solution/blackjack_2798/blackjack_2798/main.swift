//
//  main.swift
//  blackjack_2798
//
//  Created by 서보경 on 2020/10/06.
//

import Foundation

// MARK: - 2798 블랙잭
// https://www.acmicpc.net/problem/2798

let input = readLine()
let input2 = readLine()
var result = 0
if let input = input, let input2 = input2 {
    let info = input.components(separatedBy: " ").map{ Int($0)! }
    let cards = input2.components(separatedBy: " ").map{ Int($0)! }
    
    let maxValue = info[1]
    
    
    for i in 0 ..< cards.count {
        for j in i+1 ..< cards.count {
            for k in j+1 ..< cards.count {
                let sum = cards[i] + cards[j] + cards[k]
                if sum <= maxValue {
                    result = max(sum, result)
                }
            }
        }
    }
    
    print(result)
}
