//
//  main.swift
//  number_card2_10816
//
//  Created by 서보경 on 2020/11/07.
//

import Foundation

// MARK: - 10816 숫자 카드2
// https://www.acmicpc.net/problem/10816

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

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
arr.sort()

let x = Int(readLine()!)!
var finding = readLine()!.split(separator: " ").map{ Int(String($0))! }

var answer = ""
for item in finding {
    answer += "\(count_of_arr(arr, item)) "
}
answer.removeLast()
print(answer)
