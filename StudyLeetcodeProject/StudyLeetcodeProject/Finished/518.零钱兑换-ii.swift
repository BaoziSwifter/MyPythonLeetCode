//
//  518.-零钱兑换-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution518 {
    func change(_ target: Int, _ coins: [Int]) -> Int {
        if coins.count <= 0 { return 0 }
        if target == 0 { return 1 }
        // dp[i] 表示金额之和为i的硬币组合数
        var dp = [Int](repeating: 0, count: target + 1)
        dp[0] = 1
        for c in coins {
            for i in 1...target {
                guard i >= c else {
                    continue
                }
                dp[i] += dp[i-c]
            }
        }
        return dp[target]
    }
}




