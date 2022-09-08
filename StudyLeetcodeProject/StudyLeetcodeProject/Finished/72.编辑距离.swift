//
//  72.-编辑距离.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution72 {
    // 暴力法，超时
    func minDistance_baoli(_ word1: String, _ word2: String) -> Int {
        func dp(_ s1: [Character], _ s2: [Character], _ i: Int, _ j: Int) -> Int {
            if i == -1 { return j + 1 }
            if j == -1 { return i + 1 }
            if s1[i] == s2[j] { return dp(s1, s2, i - 1, j - 1) }
            return min(
                min(dp(s1, s2, i, j - 1), // 插入
                    dp(s1, s2, i - 1, j)), // 删除
                 dp(s1, s2, i - 1, j - 1) // 替换
            ) + 1
        }
        let m = word1.count, n = word2.count
        return dp(Array(word1), Array(word2), m, n)
    }
    // 备忘录 节省时间
    func minDistance_beiwanglu(_ word1: String, _ word2: String) -> Int {
        let m = word1.count, n = word2.count
        var memo = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        func dp(_ s1: [Character], _ s2: [Character], _ i: Int, _ j: Int) -> Int {
            if i == -1 { return j + 1 }
            if j == -1 { return i + 1 }
            // 检查备忘录，避免子问题
            if memo[i][j] != -1 { return memo[i][j] }
            if s1[i] == s2[j] { memo[i][j] = dp(s1, s2, i - 1, j - 1) }
            else {
                memo[i][j] = min(
                    min(
                        dp(s1, s2, i, j - 1),
                        dp(s1, s2, i - 1, j)
                    ),
                    dp(s1, s2, i - 1, j - 1)
                ) + 1
            }
            return memo[i][j]
        }
        return dp(Array(word1), Array(word2), m - 1, n - 1)
    }
}
