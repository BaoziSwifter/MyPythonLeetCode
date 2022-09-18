/*
 * @lc app=leetcode.cn id=279 lang=swift
 *
 * [279] 完全平方数
 */

// @lc code=start
class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            var minVal = Int.max
            var j = 1
            while j * j <= i {
                minVal = min(minVal, dp[i - j * j])
                j += 1
            }
            dp[i] = minVal + 1
        }
        return dp[n]
    }
}
// @lc code=end

