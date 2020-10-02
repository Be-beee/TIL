//
//  main.swift
//  Binary_Search
//
//  Created by 서보경 on 2020/08/31.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

// 반복문을 활용한 이분 검색
func binary_search<T: Comparable>(_ sortedArray: [T], _ key: T) -> Int? {
    var lo = 0
    var hi = sortedArray.count
    
    while lo < hi {
        let mid = lo/2 + hi/2
        if sortedArray[mid] == key {
            return mid
        } else if sortedArray[mid] > key {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return nil
}

// 재귀를 활용한 이분 검색
func binary_search<T: Comparable>(sortedArray: [T], key: T, lo: Int, hi: Int) -> Int? {
    if lo > hi {
        return nil
    } else {
        let mid = lo/2 + hi/2
        if sortedArray[mid] == key {
            return mid
        } else if sortedArray[mid] > key {
            return binary_search(sortedArray: sortedArray, key: key, lo: lo, hi: mid)
        } else {
            return binary_search(sortedArray: sortedArray, key: key, lo: mid + 1, hi: hi)
        }
    }
}


// Test

let array = [1, 3, 4, 5, 6, 7]

print(binary_search(array, 4) ?? -1)
print(binary_search(sortedArray: array, key: 5, lo: 0, hi: array.count) ?? -1)

