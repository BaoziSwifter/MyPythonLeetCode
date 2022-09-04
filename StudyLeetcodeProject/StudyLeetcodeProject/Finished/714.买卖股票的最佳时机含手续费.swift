//
//  714.买卖股票的最佳时机含手续费.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/30.
//

import Foundation
class Solution714 {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
//  dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
//  dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i] - fee)
        let cnt = prices.count
        if cnt <= 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: cnt)
        dp[0][0] = 0
        dp[0][1] = -prices[0] - fee
        for i in 1..<cnt {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i] - fee)
        }
        return dp[cnt - 1][0]
    }
    
    func maxProfit_1(_ prices: [Int], _ fee: Int) -> Int {
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
