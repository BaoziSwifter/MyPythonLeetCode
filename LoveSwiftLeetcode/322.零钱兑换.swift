/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 */

// @lc code=start
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if amount < 0 {
            return -1
        }
        var dp = [Int](repeating: 0, count: amount + 1)
        for i in 1 ... amount {
            var minValue = Int.max
            for c in coins {
                if i - c >= 0, dp[i-c] < minValue {
                    minValue = dp[i-c] + 1
                }
            }
            dp[i] = minValue
        }
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
// @lc code=end

