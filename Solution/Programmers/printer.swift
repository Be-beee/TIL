//
//  main.swift
//  programmers_printer
//
//  Created by 서보경 on 2020/10/07.
//

import Foundation

// MARK: - 프린터 (스택, 큐)
// https://programmers.co.kr/learn/courses/30/lessons/42587

struct Queue<T> {
    var items: [T] = []
    var length: Int {
        return items.count
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    mutating func dequeue() -> T? {
        return (length == 0) ? nil : items.removeFirst()
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var waitingList = Queue<Int>()
    var sortedPriorities = priorities.sorted()
    var answer = 1
    for index in 0 ..< priorities.count {
        waitingList.enqueue(index)
    }

    while waitingList.length != 0 {
        if let item = waitingList.dequeue() {
            if priorities[item] != sortedPriorities[sortedPriorities.count-1] {
                waitingList.enqueue(item)
            }  else {
                if item == location {
                    break
                }
                sortedPriorities.removeLast()
                answer += 1
            }
        }
        
    }
    
    return answer
}
