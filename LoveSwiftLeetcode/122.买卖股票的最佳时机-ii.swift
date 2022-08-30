/*
 * @lc app=leetcode.cn id=122 lang=swift
 *
 * [122] 买卖股票的最佳时机 II
 */

// @lc code=start
class Solution {
    func maxProfit_0(_ prices: [Int]) -> Int {
        var curMin = 0, curMax = Int.max
        var profit = 0
        for i in prices {
            var needC = false
            if i > curMax {
                curMin = curMax
                curMax = i
                needC = true
            }else if i < curMax {
                curMin = i
                curMax = i
            }
            if needC {
                profit += (curMax - curMin)
            }
        }
        return profit
    }
}
// @lc code=end

