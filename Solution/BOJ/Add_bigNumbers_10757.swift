//
//  main.swift
//  Add_bigNumbers_10757
//
//  Created by 서보경 on 2021/04/03.
//

let input = readLine()!.split(separator: " ").map{ String($0) }
let input1: [Int] = Array(input[0]).map{ Int(String($0)) ?? 0 }.reversed()
let input2: [Int] = Array(input[1]).map{ Int(String($0)) ?? 0 }.reversed()

var answer: [Int] = []
var tmp = 0
var curIdx = 0

let smallCount = (input1.count < input2.count) ? input1.count : input2.count

for idx in 0 ..< smallCount {
    curIdx = idx
    let item = input1[idx] + input2[idx] + tmp
    answer.append(item%10)
    tmp = item/10
}

if input2.count-1 > curIdx {
    for idx in curIdx+1 ..< input2.count {
        let item = (input2[idx]+tmp)
        answer.append(item%10)
        tmp = item/10
    }
    
} else if input1.count-1 > curIdx {
    for idx in curIdx+1 ..< input1.count {
        let item = (input1[idx]+tmp)
        answer.append(item%10)
        tmp = item/10
    }
}
answer.append(tmp)

var result = ""
for item in answer.reversed() {
    result += "\(item)"
}
if let first = result.first, first == "0" {
    result.removeFirst()
}

print(result)
