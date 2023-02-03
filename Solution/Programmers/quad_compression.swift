//
//  main.swift
//  programmers_quad_compression
//
//  Created by 서보경 on 2021/11/23.
//

// 프로그래머스: 쿼드압축 후 개수 세기
// https://programmers.co.kr/learn/courses/30/lessons/68936?language=swift

import Foundation

var result: [Int] = []

func compress(_ arr: [[Int]], _ area: [Int]) {
    // area: x1, y1, x2, y2
    let answer = arr[area[0]][area[1]]
    var isCompressed = true
    
    if area[0] > area[2] || area[1] > area[3] {
        return
    }
    for i in area[0] ... area[2] {
        for j in area[1] ... area[3] {
            if arr[i][j] != answer {
                isCompressed = false
                break
            }
        }
    }
    
    if isCompressed {
        result.append(answer)
        return
    } else {
        let newBoundary = [(area[0]+area[2])/2, (area[1]+area[3])/2]
        let bound1 = [area[0], area[1], newBoundary[0], newBoundary[1]]
        let bound2 = [area[0], newBoundary[1]+1, newBoundary[0], area[3]]
        let bound3 = [newBoundary[0]+1, area[1], area[2], newBoundary[1]]
        let bound4 = [newBoundary[0]+1, newBoundary[1]+1, area[2], area[3]]
        
        compress(arr, bound1)
        compress(arr, bound2)
        
        compress(arr, bound3)
        compress(arr, bound4)
        return
    }
}

func solution(_ arr:[[Int]]) -> [Int] {
    compress(arr, [0, 0, arr.count-1, arr[0].count-1])
    let zero = result.filter{ $0 == 0 }.count
    let one = result.filter{ $0 == 1 }.count
    // print(result)
    return [zero, one]
}
