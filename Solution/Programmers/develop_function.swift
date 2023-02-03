//
//  main.swift
//  programmers_develop_function
//
//  Created by 서보경 on 2021/01/05.
//

// MARK: - 프로그래머스 기능개발
// https://programmers.co.kr/learn/courses/30/lessons/42586?language=swift

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var release = [Int]()
    var complete = [Int]()

    for i in progresses.indices {
        var item = 0
        if (100 - progresses[i]) % speeds[i] != 0 {
            item = (100 - progresses[i]) / speeds[i] + 1
        } else {
            item = (100 - progresses[i]) / speeds[i]
        }
        complete.append(item)
    }


    var hit = 1
    var hitItem = complete[0]
    for i in 1 ..< complete.count + 1 {
        if i > complete.count - 1 {
            release.append(hit)
            break
        }
        if hitItem < complete[i] {
            release.append(hit)
            hitItem = complete[i]
            hit = 1
        } else {
            hit += 1
        }
    }
    
    return release
}
