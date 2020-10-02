//
//  main.swift
//  Selection_Sort
//
//  Created by 서보경 on 2020/09/03.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

//selection sort
func selection_sort<T>(_ a: [T], _ compare:(T, T) -> Bool) -> [T] {
    var array = a
    for i in array.indices {
        var minIndex = i
        for j in i+1 ..< array.count {
            if compare(array[j], array[minIndex]) {
                minIndex = j
            }
        }
        let tmp = array[i]
        array[i] = array[minIndex]
        array[minIndex] = tmp
    }
    
    return array
}

var items: [Int] = [9, 6, 7, 3, 5]
print(selection_sort(items, {$0 < $1}))
