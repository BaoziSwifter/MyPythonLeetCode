/*
 * @lc app=leetcode.cn id=62 lang=swift
 *
 * [62] 不同路径
 */

// @lc code=start
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: m)
        for _ in 1..<n {
            for c in 1..<m {
                dp[c] = dp[c] + dp[c - 1]
            }
        }
        return dp[m-1]
    }
}
// @lc code=end

