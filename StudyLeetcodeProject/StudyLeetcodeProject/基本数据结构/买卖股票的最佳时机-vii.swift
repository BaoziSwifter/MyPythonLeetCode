//
//  买卖股票的最佳时机-vii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/30.
//

import Foundation

class SolutionStockVII {
    func maxProfit_all_in_one(_ max_k: Int, _ prices: [Int], _ cooldown: Int, _ fee: Int) -> Int {
        let n = prices.count
        if n <= 0 || max_k == 0 || cooldown > n - 1 { return 0 }
        if max_k > n / 2 { return maxProfit_k_inf(prices, cooldown, fee) }
        let dp1 = [0, Int.min]
        let dp2 = [[Int]](repeating: dp1, count: max_k + 1)
        var dp = [[[Int]]](repeating: dp2, count: n)
        
        for i in 0 ..< n {
            for k in 1 ... max_k {
                if i - 1 == -1 {
                    // base case 1
                    dp[i][k][0] = 0
                    dp[i][k][1] = -prices[i] - fee
                    continue
                }
                if i - cooldown - 1 < 0 {
                    // base case 2
                    dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
                    dp[i][k][1] = max(dp[i-1][k][1], -prices[i] - fee)
                    continue
                }
                dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
                dp[i][k][1] = max(dp[i-1][k][1], dp[i-cooldown-1][k-1][0] - prices[i] - fee)
            }
        }
        return dp[n-1][max_k][0]
    }
    
    func maxProfit_k_inf(_ prices: [Int], _ cooldown: Int, _ fee: Int) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [0 , 0], count: n)
        for i in 0..<n {
            if i - 1 == -1 {
                // base case 1
                dp[i][0] = 0
                dp[i][1] = -prices[i] - fee
                continue
            }
            
            if i - cooldown - 1 < 0 {
                // base case 2
                dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
                dp[i][1] = max(dp[i-1][1], -prices[i] - fee)
                continue
            }
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i - cooldown - 1][0] - prices[i] - fee)
        }
        return dp[n-1][0]
    }
}
