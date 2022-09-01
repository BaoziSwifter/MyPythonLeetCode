//
//  32.-最长有效括号.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution32 {
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [Int]()
        var dp = [Int](repeating: 0, count: s.count + 1)
        for (i, c) in Array(s).enumerated() {
            if c == "(" {
                stack.append(i)
                dp[i + 1] = 0
            } else {
                if stack.count > 0 {
                    let left = stack.popLast()!
                    let len = 1 + i - left + dp[left]
                    dp[i + 1] = len
                } else {
                    dp[i + 1] = 0
                }
            }
        }
        var res = 0
        for i in 0..<dp.count {
            res = max(res, dp[i])
        }
        return res
    }
}
