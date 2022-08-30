/*
 * @lc app=leetcode.cn id=714 lang=swift
 *
 * [714] 买卖股票的最佳时机含手续费
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let cnt = prices.count
        var last = 0, cur = Int.min
        for i in 0 ..< cnt {
            let tmp = last
            last = max(last, cur + prices[i])
            cur = max(cur, tmp - prices[i] - fee)
        }
        return last
    }
}
// @lc code=end

