//
//  309.最佳买卖股票时机含冷冻期.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/30.
//

import Foundation

class Solution309 {
//  dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
//  dp[i][1] = max(dp[i-1][1], dp[i-2][0] - prices[i])
//    第i天选择买入  就要从i-2的状态转义，而不是i-1
    func maxProfit_1(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
        for i in 0 ..< n {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            if i - 2 == -1 {
                dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
                dp[i][1] = max(dp[i-1][1], -prices[i])
                continue
            }
            
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-2][0] - prices[i])
        }
        return dp[n-1][0]
    }
    
    func maxProfit_2(_ prices: [Int]) -> Int {
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
