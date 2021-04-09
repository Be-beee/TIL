//
//  main.swift
//  Making_Pw_1759
//
//  Created by 서보경 on 2021/04/09.
//

// MARK:- 1759 암호 만들기
// https://www.acmicpc.net/problem/1759

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var items = readLine()!.split(separator: " ").map{ String($0) }
var vowels: Set<String> = ["a", "e", "i", "o", "u"]
items.sort()

func makePassword(selected: Int, res: String) {
    var res = res
    var selected = selected
    if res.count == input[0] {
        var hasVowel = false
        var count = 0
        for item in res {
            if vowels.contains(String(item)) {
                hasVowel = true
            } else {
                count += 1
            }
        }
        
        if hasVowel, count > 1 {
            print(res)
        }
        return
    }
    for i in selected ..< input[1] {
        res += "\(items[i])"
        selected += 1
        makePassword(selected: selected, res: res)
        res.removeLast()
    }
    
}

makePassword(selected: 0, res: "")


