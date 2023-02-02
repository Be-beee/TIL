//
//  main.swift
//  snail_1913
//
//  Created by 서보경 on 2020/10/10.
//

import Foundation

// MARK: - 1913 달팽이
// https://www.acmicpc.net/problem/1913

func snail(n: Int) -> [[Int]] {
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n+2), count: n+2) // 주의!
    var i = 0
    var j = 1
    var c = n*n
    for i in 0 ... n+1 {
        res[0][i] = -1
        res[n+1][i] = -1
        res[i][0] = -1
        res[i][n+1] = -1
    }
    
    while c >= 1 {
        // down -> right -> up -> left
        while res[i+1][j] == 0 {
            i += 1
            res[i][j] = c
            c -= 1
        }
        while res[i][j+1] == 0 {
            j += 1
            res[i][j] = c
            c -= 1
        }
        while res[i-1][j] == 0 {
            i -= 1
            res[i][j] = c
            c -= 1
        }
        while res[i][j-1] == 0 {
            j -= 1
            res[i][j] = c
            c -= 1
        }
    }
    
    return res
}

let n = Int(readLine()!)!
let xy = Int(readLine()!)!

let arr = snail(n: n)
var x = 0
var y = 0
for i in arr.indices {
    var str = ""
    for j in arr[i].indices{
        if i != 0, j != 0, i != n+1, j != n+1 {
            str += "\(arr[i][j]) "
        }
        if xy == arr[i][j] {
            x = i
            y = j
        }
    }
    if !str.isEmpty {
        print(str)
    }
}
if x != 0, y != 0 {
    print("\(x) \(y)")
}
