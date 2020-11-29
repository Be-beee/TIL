//
//  main.swift
//  Heap
//
//  Created by 서보경 on 2020/11/29.
//

import Foundation

// MARK:- Heap
// references: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap

//enum Criteria {
//    case max, min
//}

struct Heap<T> {
    var nodes: [T] = []
    var order: (T, T) -> Bool // maxheap, minheap
    
    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    init(nodes: [T], order: @escaping (T, T) -> Bool) {
        self.nodes = nodes
        self.order = order
    }
    
    private var isEmpty: Bool {
        return nodes.isEmpty
    }
    private var count: Int {
        return nodes.count
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
          nodes.swapAt(index, size)
          shiftDown(from: index, until: size)
          shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = (childIndex-1)/2
        
        while childIndex > 0 && order(child, nodes[parentIndex]) {
          nodes[childIndex] = nodes[parentIndex]
          childIndex = parentIndex
          parentIndex = (childIndex-1)/2
        }
        
        nodes[childIndex] = child
    }
    
    mutating func shiftDown(from index: Int, until endIndex: Int) {
        let lcIdx = 2*index + 1
        let rcIdx = lcIdx + 1
        var first = index
        if lcIdx < endIndex && order(nodes[lcIdx], nodes[first]) {
          first = lcIdx
        }
        if rcIdx < endIndex && order(nodes[rcIdx], nodes[first]) {
          first = rcIdx
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}
