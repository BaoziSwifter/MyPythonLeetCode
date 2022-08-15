//
//  115.不同的子序列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution115 {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        let sCount = sArr.count
        let tCount = tArr.count
        if sCount < tCount {
            return 0
        }
        var dp = Array.init(repeating: Array.init(repeating: 0, count: tCount + 1), count: sCount + 1)
        for i in 0...sCount {
            dp[i][tCount] = 1
        }
        for i in stride(from: sCount - 1, through: 0, by: -1) {
            let si = sArr[i]
            for j in stride(from: tCount - 1, through: 0, by: -1) {
                let tj = tArr[j]
                /// si与tj相同时有两种选择，不同时只能往后查找
                /// dp[i+1][j+1] 选择si与tj匹配
                /// dp[i+1][j] 不选择si与tj匹配
                if si == tj {
                    dp[i][j] = dp[i + 1][j + 1] + dp[i + 1][j]
                } else {
                    dp[i][j] = dp[i + 1][j]
                }
            }
        }
        return dp[0][0]
    }
    
    // 暴力解法
    func baoli(_ s: [Character], s_start: Int, _ t: [Character], t_start: Int) -> Int {
        if t_start == t.count {
            return 1
        }
        if s_start == s.count {
            return 0
        }
        var result = 0
        for i in s_start..<s.count {
            if s[i] == t[t_start] {
                result += baoli(s, s_start: s_start + 1, t, t_start: t_start + 1)
            }
        }
        return result
    }
    
}
