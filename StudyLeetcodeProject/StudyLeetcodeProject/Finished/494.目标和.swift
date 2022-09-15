//
//  494.-目标和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution494 {
    // 回溯
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var count = 0
        func backtrace(_ index: Int, _ curValue: Int) {
            if index >= nums.count - 1 {
                if nums[index] + curValue == target {
                    count += 1
                }
                if curValue - nums[index] == target {
                    count += 1
                }
            } else {
                backtrace(index + 1, curValue + nums[index])
                backtrace(index + 1, curValue - nums[index])
            }
        }
        backtrace(0, 0)
        return count
    }
    // 动态规划
    func findTargetSumWays_dp2(_ nums: [Int], _ target: Int) -> Int {
        /**
        记数组的元素和为 sum，添加 - 号的元素之和为 neg，则其余添加 + 的元素之和为 sum−neg，得到的表达式的结果为
        (sum−neg)−neg=sum−2⋅neg=target
         neg = (sum - target)/2
         由于数组 nums 中的元素都是非负整数，neg 也必须是非负整数，所以上式成立的前提是 sum−target 是非负偶数。若不符合该条件可直接返回 0。
         若上式成立，问题转化为在数组中选取若干元素，使得这些元素之和为neg，计算选取元素的方案是
         
         定义二维数组dp，气其中dp[i][j]表示在数组前i个数中选取元素，使得这些元素之和等于j方案数
         假设数组nums的长度为n，则最终答案为dp[n][neg]
         边界条件是
         当没有任何元素时，元素和为0，对应的方案数是1
         dp[0][j]=  { 1, j = 0
                    { 0, j >= 1
         当 1<=i<=n时 对于数组nums中的第i个元素num ，遍历 0 <= j <= neg,计算 dp[i][j]的值
         如果 j < num 则不能选取 num， 此时有 dp[i][j] = dp[i-1][j]
         如果 j >= num 则如果不选取num 方案是dp[i-1][j]; 如果选取num，则方案数十 dp[i-1][j-num],
            此时有 dp[i][j] = dp[i-1][j] + dp[i-1][j-num]
         
         */
        var sum = nums.reduce(0) { $0 + $1}
        let diff = sum - target
        if diff < 0 || diff % 2 != 0 {
            return 0
        }
        let n = nums.count, neg = diff / 2
        var dp = [[Int]](repeating: [Int](repeating: 0, count: neg + 1), count: n + 1)
        dp[0][0] = 1
        for i in 1...n {
            let num = nums[i-1]
            for j in 0...neg {
                dp[i][j] = dp[i-1][j]
                if j >= num {
                    dp[i][j] += dp[i-1][j-num]
                }
            }
        }
        return dp[n][neg]
    }
    // 由于 dp 的每一行的计算只和上一行有关，因此可以使用滚动数组的方式，去掉 dp 的第一个维度，将空间复杂度优化到 O(neg)。
    func findTargetSumWays_dp1(_ nums: [Int], _ target: Int) -> Int {
        var sum = nums.reduce(0) { $0 + $1}
        let diff = sum - target
        if diff < 0 || diff % 2 != 0 {
            return 0
        }
        let neg = diff / 2
        var dp = [Int](repeating: 0, count: neg + 1)
        dp[0] = 1
        for num in nums {
            if num <= neg {
                for j in (num...neg).reversed() {
                    dp[j] += dp[j - num]
                }
            }
        }
        return dp[neg]
    }
}
