//
//  1143.-最长公共子序列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution1143 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text2.count <= text1.count else {
            return longestCommonSubsequence(text2, text1)
        }
        let s1 = Array(text1);
        let s2 = Array(text2)
        var dp = Array(repeating: 0, count: s2.count)
        for i in 0..<s1.count {
            var cur = 0
            for j in 0..<s2.count {
                let next = dp[j]
                if s1[i] == s2[j] {
                    dp[j] = 1 + cur
                } else {
                    dp[j] = max(dp[j], j > 0 ? dp[j-1] : 0)
                }
                cur = next
            }
            
        }
        return dp.last!
    }
    
    func longestCommonSubsequence_dp2(_ text1: String, _ text2: String) -> Int {
        let dp_1 = [Int](repeating: 0, count: text2.count + 1)
        var dp = [[Int]](repeating: dp_1, count: text1.count + 1)
        
        let s1 = Array(text1)
        let s2 = Array(text2)
        
        for i in 1 ... s1.count {
            for j in 1 ... s2.count {
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[s1.count][s2.count]
    }
}
