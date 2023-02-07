//
//  main.swift
//  ValidParentheses
//
//  Created by 서보경 on 2023/02/06.
//

import Foundation

// MARK: - 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/description/

// 다음에는 조금 더 효율적인 방법으로 풀고 싶음
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var added: [Int] = []
        var current1 = l1
        var current2 = l2

        while current1 != nil || current2 != nil {
            let partial = (current1?.val ?? 0) + (current2?.val ?? 0)
            added.append(partial)

            if current1 != nil { current1 = current1?.next }
            if current2 != nil { current2 = current2?.next }
        }

        for i in 0 ..< added.count {
            let tmp = added[i]/10
            if tmp <= 0 { continue }
            added[i] %= 10
            
            if i < added.count-1 { added[i+1] = added[i+1] + tmp }
            else { added.append(tmp) }
        }

        var answer = ListNode(added.first!)
        var ansCurrent: ListNode? = answer

        for (i, item) in added.enumerated() {
            if i == 0 { continue }
            let next = ListNode(item)
            ansCurrent?.next = next
            ansCurrent = ansCurrent?.next
        }

        return answer
    }
}
