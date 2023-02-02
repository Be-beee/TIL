//
//  main.swift
//  programmers_sort_filename
//
//  Created by 서보경 on 2021/11/30.
//

// 프로그래머스: 파일명 정렬
// https://programmers.co.kr/learn/courses/30/lessons/17686?language=swift

import Foundation

enum Mode {
    case head, number, tail
}

struct FileArea {
    var head: String = ""
    var number: Int = 0
    var tail: String = ""
}

func divideCase(_ str: String) -> FileArea {
    var result = FileArea()
    var mode = Mode.head
    var tmp = ""
    for s in str {
        if let _ = Int(String(s)) {
            switch mode {
            case .head:
                result.head = tmp
                tmp = "\(s)"
                mode = .number
            case .number, .tail:
                tmp += "\(s)"
            }
        } else { // head or tail
            switch mode {
            case .head, .tail:
                tmp += "\(s)"
            case .number:
                result.number = Int(tmp)!
                tmp = "\(s)"
                mode = .tail
            }
        }
    }
    
    switch mode {
    case .head:
        result.head = tmp
    case .number:
        result.number = Int(tmp)!
    default:
        result.tail = tmp
    }
    
    return result
}

func solution(_ files:[String]) -> [String] {
    let result = files.sorted {
        let fa1 = divideCase($0)
        let fa2 = divideCase($1)
        
        if fa1.head.lowercased() != fa2.head.lowercased() {
            return fa1.head.lowercased() < fa2.head.lowercased()
        } else if fa1.number != fa2.number {
            return fa1.number < fa2.number
        }
        return false
    }
    
    return result
}
