/*
 * @lc app=leetcode.cn id=121 lang=swift
 *
 * [121] 买卖股票的最佳时机
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        if prices.count == 0 {
            return 0
        }
        var leftMin = prices[0]
        for i in prices {
            leftMin = min(i, leftMin)
            profit = max(profit, i - leftMin)
        }
        return profit
    }
}
// @lc code=end

