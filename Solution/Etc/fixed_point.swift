//
//  main.swift
//  fixed_point
//
//  Created by 서보경 on 2020/10/21.
//

import Foundation

// MARK: - [이것이 코딩테스트다] 고정점 찾기

func binary_search(_ arr: [Int], _ lo: Int, _ hi: Int) -> Int {
    var lo = lo
    var hi = hi
    while lo <= hi {
        let mid = (lo+hi)/2
        if arr[mid] == mid {
            return mid
        } else if arr[mid] < mid {
            lo = mid+1
        } else {
            hi = mid-1
        }
    }
    return -1
}

let N = Int(readLine()!)!
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let result = binary_search(arr, 0, N-1)
print(result)
