/*
 * @lc app=leetcode.cn id=309 lang=swift
 *
 * [309] 最佳买卖股票时机含冷冻期
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var pre = 0, last = 0, cur = Int.min
        for i in 0..<n {
            let tmp = last
            last = max(last, cur + prices[i])
            cur = max(cur, pre - prices[i])
            pre = tmp
        }
        return last
    }
}
// @lc code=end

