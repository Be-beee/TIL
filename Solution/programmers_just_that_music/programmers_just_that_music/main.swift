//
//  main.swift
//  programmers_just_that_music
//
//  Created by 서보경 on 2021/11/18.
//

// 프로그래머스: 방금 그 곡
// https://programmers.co.kr/learn/courses/30/lessons/17683

import Foundation

func getPlayTime(start: String, end: String) -> Int {
    var time = 0
    
    let startArr = start.split(separator: ":").map{ Int(String($0))! }
    var endArr = end.split(separator: ":").map{ Int(String($0))! }
    
    if startArr[1] <= endArr[1] {
        time += abs(endArr[1] - startArr[1])
    } else {
        time += (60 + endArr[1]) - startArr[1]
        endArr[0] -= 1
    }
    
    time += 60 * (endArr[0] - startArr[0])
    
    
    return time
}


func solution(_ m:String, _ musicinfos:[String]) -> String {
    let replacingChar = [ "C#": "U", "D#": "W", "F#": "X", "G#": "Y", "A#": "Z" ]
    var answer = "(None)"
    var correctAnswers: [(time: Int, title: String)] = []
    
    var changedM = m
    for (key, value) in replacingChar {
        changedM = changedM.replacingOccurrences(of: key, with: value)
    }
    
    for info in musicinfos {
        let infoArr = info.split(separator: ",").map{ String($0) }
        let playTime = getPlayTime(start: infoArr[0], end: infoArr[1])
        var mainPart = infoArr[3]
        for (key, value) in replacingChar {
            mainPart = mainPart.replacingOccurrences(of: key, with: value)
        }
        
        while mainPart.count <= playTime {
            mainPart += mainPart
        }
        
        let index = mainPart.index(mainPart.startIndex, offsetBy: playTime)
        mainPart = String(mainPart[mainPart.startIndex ..< index])
        
        if mainPart.contains(changedM) {
            correctAnswers.append((time: playTime, title: infoArr[2]))
        }
    }
    
    correctAnswers.sort { $0.time > $1.time }
    if correctAnswers.count > 0 {
        answer = correctAnswers[0].title
    }
    
    return answer
}
