//
//  main.swift
//  InsertSort
//
//  Created by 서보경 on 2020/09/01.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

func insertSort<T: Comparable>(_ array: [T], _ compare: (T, T) -> Bool) -> [T] {
    var sorted: [T] = []
    for i in array {
        sorted.append(i)
        var currentIndex = sorted.count - 1
        while currentIndex > 0, compare(sorted[currentIndex], sorted[currentIndex - 1]) {
            let tmp = sorted[currentIndex]
            sorted[currentIndex] = sorted[currentIndex - 1]
            sorted[currentIndex - 1] = tmp
            currentIndex -= 1
        }
    }
    return sorted
}

var items: [Int] = [98, 0, 17, 49, 4, 63, 10, 21]
print(insertSort(items, {$0 < $1}))
