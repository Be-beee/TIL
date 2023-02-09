//
//  main.swift
//  MergeTwoSortedLists
//
//  Created by 서보경 on 2023/02/09.
//

import Foundation

// MARK: - 67. Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/description/

// 각 링크드 리스트 순회와 동시에 정렬할 수 있으면 좋을 것 같음
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var current1 = list1
        var current2 = list2

        var list: [Int] = []

        while current1 != nil || current2 != nil {
            if current1 == nil {
                list.append(current2!.val)
                current2 = current2?.next
            } else if current2 == nil {
                list.append(current1!.val)
                current1 = current1?.next
            } else {
                if current1!.val < current2!.val {
                    list.append(current1!.val)
                    current1 = current1?.next
                } else {
                    list.append(current2!.val)
                    current2 = current2?.next
                }
            }
        }

        if list.count == 0 { return nil }

        var answer: ListNode? = ListNode(list[0])
        var current = answer

        for (i, item) in list.enumerated() {
            if i == 0 { continue }
            let node = ListNode(item)
            current?.next = node
            current = current?.next
        }

        return answer
    }
}
