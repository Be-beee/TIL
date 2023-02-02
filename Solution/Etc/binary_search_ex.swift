//
//  main.swift
//  binary_search_ex
//
//  Created by 서보경 on 2020/10/21.
//

import Foundation

// MARK: - [이것이 코딩테스트다] 정렬된 배열에서 특정 수의 개수 구하기
// 이진 검색 활용

func count_of_arr(_ arr: [Int], _ x: Int) -> Int {
    let n = arr.count
    let a = first(arr, x, 0, n-1)
    if a == -1 {
        return 0
    }
    let b = last(arr, x, 0, n-1)
    return b-a+1
}

func first(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    var start = start
    var end = end
    while start <= end {
        let mid = (start+end)/2
        if (mid == 0 || target > arr[mid-1]), arr[mid] == target {
            return mid
        }
        else if arr[mid] >= target {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return -1
}

func last(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    var start = start
    var end = end
    while start <= end {
        let mid = (start+end)/2
        if (mid == arr.count-1 || target < arr[mid+1]), arr[mid] == target {
            return mid
        }
        else if arr[mid] > target {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return -1
}

let Nx = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let number = count_of_arr(arr, Nx[1])
if number == 0 {
    print(-1)
} else {
    print(number)
}
