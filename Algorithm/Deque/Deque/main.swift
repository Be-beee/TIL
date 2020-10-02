//
//  main.swift
//  Deque
//
//  Created by 서보경 on 2020/09/02.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

struct Deque<T> {
    var items: [T] = []
    var isEmpty: Bool {
        return items.isEmpty
    }
    var length: Int {
        return items.count
    }
    var last: T? {
        return items.last
    }
    var first: T? {
        return items.first
    }
    
    mutating func enqueue_front(_ item: T) {
        items.insert(item, at: 0)
    }
    mutating func enqueue_back(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue_front() -> T {
        return items.removeFirst()
    }
    mutating func dequeue_back() -> T {
        return items.removeLast()
    }
}
