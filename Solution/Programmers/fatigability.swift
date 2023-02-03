//
//  main.swift
//  programmers_fatigability
//
//  Created by 서보경 on 2021/11/28.
//

import Foundation

func permute(_ nums: [[Int]], _ targetNum: Int) -> [[[Int]]] {
    var result = [[[Int]]]()
    var visited = [Bool](repeating: false, count: nums.count)
    
    func permutation(_ nowPermute: [[Int]]) {
        if nowPermute.count == targetNum {
            result.append(nowPermute)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == true {
                continue
            }
            else {
                visited[i] = true
                permutation(nowPermute + [nums[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}


func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var cur = k
    var result = 0
    let permuted = permute(dungeons, dungeons.count)
    
    for cases in permuted {
        var num = 0
        for d in cases {
            if d[0] <= cur {
                num += 1
                cur -= d[1]
            }
        }
        if num > result {
            result = num
        }
        cur = k
    }
    return result
}
