//
//  heap.swift
//  Dijkstra
//
//  Created by 서보경 on 2021/04/23.
//


// MARK:- Heap
// references: <씩이 머릿속> [스위프트:자료구조] Heap: 힙 자료구조 (2 / 2) : Heap 구현하기 https://the-brain-of-sic2.tistory.com/63?category=779571

import Foundation

struct Heap<T> {
    var items: [T] = []
    let sort: (T, T) -> Bool // maxheap, minheap
    
    init(sort: @escaping (T, T) -> Bool, items: [T]) {
        self.sort = sort
        self.items = items
        
        if !items.isEmpty {
            for i in stride(from: items.count/2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var count: Int {
        return items.count
    }

    func peek() -> T? {
        return items.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1)/2
    }
    
    mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }
        items.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return items.removeLast()
    }
    mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            if left < count , sort(items[left], items[candidate]) {
                candidate = left
            }
            if right < count , sort(items[right], items[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            items.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func insert(_ item: T) {
     
        items.append(item)
        siftUp(from: count - 1)
        
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        
        while true {
            let parent = parentIndex(ofChildAt: child)
            
            if child > 0 && sort(items[child], items[parent]) {
                items.swapAt(child, parent)
                child = parent
            }else {
                return
            }
        }
    }
}
