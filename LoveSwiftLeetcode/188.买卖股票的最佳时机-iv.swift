/*
 * @lc app=leetcode.cn id=188 lang=swift
 *
 * [188] 买卖股票的最佳时机 IV
 */

// @lc code=start
class Solution {
    func maxProfit_k_inf(_ prices: [Int]) -> Int {
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
    // dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
    // dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1] - prices[i])
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if n <= 0 || k == 0 { return 0 }
        if k > n / 2 { return maxProfit_k_inf(prices) }
        let dp1 = [0, Int.min]
        let dp2 = [[Int]](repeating: dp1, count: k + 1)
        var dp = [[[Int]]](repeating: dp2, count: n)
        for i in 0..<n {
            for ki in 1...k {
                if i - 1 == -1 {
                    dp[i][ki][0] = 0
                    dp[i][ki][1] = -prices[i]
                    continue
                }
                dp[i][ki][0] = max(dp[i-1][ki][0], dp[i-1][ki][1] + prices[i])
                dp[i][ki][1] = max(dp[i-1][ki][1], dp[i-1][ki-1][0] - prices[i])
            }
        }
        return dp[n-1][k][0]
    }
}
// @lc code=end


 