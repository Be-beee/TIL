//
//  main.swift
//  programmers_open_chat
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 오픈 채팅방
// https://programmers.co.kr/learn/courses/30/lessons/42888

func solution(_ record:[String]) -> [String] {
    
    var dic:[String:String] = [:]
    var res: [String] = []
    for value in record {
        let tmp = value.components(separatedBy: " ")
        switch tmp[0] {
        case "Enter", "Change":
            dic.updateValue(tmp[2], forKey: tmp[1])
        default:
            break
        }
    }
    for value in record {
        let tmp = value.components(separatedBy: " ")
        switch tmp[0] {
        case "Enter":
            res.append("\(dic[tmp[1], default: ""])님이 들어왔습니다.")
        case "Leave":
            res.append("\(dic[tmp[1], default: ""])님이 나갔습니다.")
        default:
            break
        }
    }
    
    return res
}
