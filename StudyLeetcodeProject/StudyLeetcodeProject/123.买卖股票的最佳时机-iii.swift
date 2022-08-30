//
//  123.买卖股票的最佳时机-iii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/30.
//

import Foundation

class Solution123 {
    func maxProfit(_ prices: [Int]) -> Int {
//  dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
//  dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
        let max_k = 2, cnt = prices.count
        let dp1 = [Int](repeating: 0, count: 2)
        let dp2 = [[Int]](repeating: dp1, count: max_k + 1)
        var dp = [[[Int]]](repeating: dp2, count: cnt)
        for i in 0 ..< cnt {
            for k in 1...max_k {
                if i - 1 == -1 {
                    dp[i][k][0] = 0
                    dp[i][k][1] = -prices[i]
                    continue
                }
                
                dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
                dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
            }
        }
        return dp[cnt-1][max_k][0]
    }
    func maxProfit_1(_ prices: [Int]) -> Int {
        var dp_i10 = 0, dp_i11 = Int.min
        var dp_i20 = 0, dp_i21 = Int.min

        for p in prices {
            dp_i20 = max(dp_i20, dp_i21 + p)
            dp_i21 = max(dp_i21, dp_i10 - p)
            dp_i10 = max(dp_i10, dp_i11 + p)
            dp_i11 = max(dp_i11, -p)
        }
        return dp_i20
    }
}
