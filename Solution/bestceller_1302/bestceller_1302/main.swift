//
//  main.swift
//  bestceller_1302
//
//  Created by 서보경 on 2020/10/05.
//

import Foundation

// MARK: - 1302 베스트셀러
// https://www.acmicpc.net/problem/1302

let num = Int(readLine()!)!
var dic: [String: Int] = [:]
for _ in 0 ..< num {
    let title = readLine()!
    dic.updateValue(dic[title, default: 0]+1, forKey: title)
}
let best = dic.max(by: { (book1, book2) -> Bool in
                if book1.value != book2.value {
                    return book1.value < book2.value
                } else {
                    return book1.key > book2.key
                }
})!.key

print(best)

