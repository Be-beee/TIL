//
//  main.swift
//  LongestCommonPrefix
//
//  Created by 서보경 on 2023/02/06.
//

import Foundation

// MARK: - 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var answer = ""
        let sample = Array(strs.min()!)

        for i in sample.indices {
            let pref = String(sample[0 ... i])
            for str in strs {
                let tmp = Array(str)
                if String(tmp[0 ... i]) != pref {
                    return answer
                }
            }
            answer = pref
        }

        return answer
    }
}
