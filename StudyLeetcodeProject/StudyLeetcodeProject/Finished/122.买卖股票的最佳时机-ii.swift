//
//  122.-买卖股票的最佳时机-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution122 {
//    dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k-1][1]+prices[i])
//    dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0]-prices[i])
//                  = max(dp[i-1][k][1], dp[i-1][k][0]-prices[i]) ===> 如果k无穷大 可以认为 k = k -1
//    ||
//    👇🏻
//    dp[i][0] = max(dp[i-1][0], dp[i-1][1]+pricers[i])
//    dp[i][1] = max(dp[i-1][1], dp[i-1][0]-prices[i])
    
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
        for i in 0..<n {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }
        return dp[n-1][0]
    }
    
    func maxProfit_1(_ prices: [Int]) -> Int {
        let count = prices.count
        var dp_i_0 = 0, dp_i_1 = Int.min
        for i in 0 ..< count {
            let tmp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, tmp - prices[i])
        }
        return dp_i_0
    }
    
    func maxProfit_2(_ prices: [Int]) -> Int {
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
