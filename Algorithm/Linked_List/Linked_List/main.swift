//
//  main.swift
//  Linked_List
//
//  Created by 서보경 on 2020/09/02.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T
    var nextNode: Node?
    var previousNode: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>? {
        guard var node = head else {
            return nil
        }
        while let next = node.nextNode {
            node = next
        }
        return node
    }
    var isEmpty: Bool {
        return head == nil
    }
    var length: Int {
        var length = 0
        guard var node = head else {
            return length
        }
        
        length += 1
        while let next = node.nextNode {
            node = next
            length += 1
        }
        
        return length
    }
    
    init() {}
    
    func append(_ value: T) {
        let newNode = Node<T>(value: value)
        append(newNode)
    }
    
    func append(_ node: Node<T>) {
        let node = node
        if let tailNode = tail {
            node.previousNode = tailNode
            tailNode.nextNode = node
            // 마지막 노드에 새로운 노드를 잇는다.
        } else {
            head = node
            // 마지막 노드가 없다면 새로운 노드가 헤드가 된다
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    func remove(_ node: Node<T>) -> T {
        let prev = node.previousNode
        let next = node.nextNode
        
        if let prev = prev {
            prev.nextNode = next
        } else {
            head = next
        }
        next?.previousNode = prev
        
        node.previousNode = nil
        node.nextNode = nil
        return node.value
    }
}


// 참고: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linked%20List
