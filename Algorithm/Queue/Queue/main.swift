//
//  main.swift
//  Queue
//
//  Created by 서보경 on 2020/08/31.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

struct IntQueue {
    var items: [Int] = []
    var length: Int {
        return items.count
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func enqueue(_ item: Int) {
        items.append(item)
    }
    mutating func dequeue() -> Int? {
        return (length == 0) ? nil : items.removeFirst()
    }
}

// 제네릭
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

// MARK:- 프로그래머스 문제: 프린터

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
