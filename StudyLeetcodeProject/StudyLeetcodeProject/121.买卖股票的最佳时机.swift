//
//  121.-买卖股票的最佳时机.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution121 {
    func maxProfit_1(_ prices: [Int]) -> Int {
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
    // dp 原始版
    func maxProfit_2(_ prices: [Int]) -> Int {
//        dp[i][1][0] = max(dp[i-1][1][0], dp[i-1][1][1] + prices[i])
//        dp[i][1][1] = max(dp[i-1][1][1], dp[i-1][0][0] - prices[i])
//                      = max(dp[i-1][1][1], - prices[i])
//        k = 0 的 base case dp[i-1][0][0] = 0
//        只交易一次 即 k = 1 去掉k
//        dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
//        dp[i][1] = max(dp[i-1][1], -prices[i])
        let n = prices.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
        for i in 0..<n {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], -prices[i])
        }
        return dp[n-1][0]
    }
    
    // dp 空间复杂度优化
    func maxProfit_3(_ prices: [Int]) -> Int {
        let n = prices.count
        // base case : dp[-1][0] = 0 dp[-1][1] = -infinity
        var dp_i_0 = 0, dp_i_1 = Int.min
        for i in 0..<n {
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, -prices[i])
        }
        return dp_i_0
    }
}
