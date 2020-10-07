//
//  main.swift
//  programmers_keypad
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 키패드 누르기
// https://programmers.co.kr/learn/courses/30/lessons/67256

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    
    var currentLeft = (3, 0)
    var currentRight = (3, 2)
    for number in numbers {
        switch number {
        case 1, 4, 7:
            answer += "L"
            currentLeft = (number/3, 0)
        case 3, 6, 9:
            answer += "R"
            currentRight = (number/3 - 1, 2)
        default:
            let res = distance(number, currentLeft, currentRight, hand)
            answer += res
            let next = (number == 0) ? (3, 1) : (number/3, 1)
            if res == "L" {
                currentLeft = next
            } else {
                currentRight = next
            }
        }
    }
    
    return answer
}

func distance(_ number: Int, _ currentLeft: (Int, Int), _ currentRight: (Int, Int), _ hand: String) -> String{
    var result = ""
    let xposition = (number == 0) ? 3 : number/3
    let distanceFromLeft = abs((xposition - currentLeft.0)) + abs((1 - currentLeft.1))
    let distanceFromRight = abs((currentRight.0 - xposition)) + abs((currentRight.1 - 1))
    
    
    if distanceFromLeft < distanceFromRight {
        result = "L"
    } else if distanceFromLeft > distanceFromRight {
        result = "R"
    } else {
        result = (hand == "left") ? "L" : "R"
    }
    
    return result
}
