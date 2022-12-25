//
//  416.-分割等和子集.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

// 背包问题
class KnapsackSolution {
    //给你一个可装载重量为 W 的背包和 N 个物品，每个物品有重量和价值两个属性。其中第 i 个物品的重量为 wt[i]，价值为 val[i]，现在让你用这个背包装物品，最多能装的价值是多少？
    func knapsack(_ W: Int, _ N: Int, _ wt: [Int], _ val: [Int]) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: W+1), count: N+1)
        for n in 1...N {
            for w in 1...W {
                if w - wt[n-1] < 0 {
                    // 背包装不下
                    dp[n][w] = dp[n-1][w]
                } else {
                    dp[n][w] = max(dp[n-1][w-wt[n-1]] + val[n], dp[n-1][w])
                }
            }
        }
        return dp[N][W]
    }
}

class Solution416 {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0) { $0 + $1 }
        if sum % 2 == 1 { return false }
        let n = nums.count
        let subSum = sum / 2
        var dp = [Bool](repeating: false, count: subSum + 1)
        dp[0] = true
        for i in 0 ..< n {
            for j in (0..<subSum+1).reversed() {
                if j - nums[i] >= 0 {
                    dp[j] = dp[j] || dp[j - nums[i]]
                }
            }
        }
        return dp[subSum]
    }
}
