//
//  main.swift
//  searching_document_1543
//
//  Created by 서보경 on 2020/10/05.
//

import Foundation

// MARK: - 1543 문서 검색
// https://www.acmicpc.net/problem/1543

let str = readLine()!
let keyword = readLine()!

var index = 0
var result = 0

while str.count - index >= keyword.count {
    let range = str.index(str.startIndex, offsetBy: index) ..< str.index(str.startIndex, offsetBy: index + keyword.count)
    if str[range] == keyword {
        result += 1
        index += keyword.count
    } else {
        index += 1
    }
}

print(result)
