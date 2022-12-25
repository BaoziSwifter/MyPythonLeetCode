//
//  96.-不同的二叉搜索树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution96 {
    
    // 动态规划 自底向上
    func numTrees(_ n: Int) -> Int {
        if n <= 1 { return 1 }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j-1]*dp[i-j]
            }
        }
        return dp[n]
    }
}
