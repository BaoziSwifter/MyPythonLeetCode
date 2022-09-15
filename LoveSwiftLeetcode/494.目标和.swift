/*
 * @lc app=leetcode.cn id=494 lang=swift
 *
 * [494] 目标和
 */

// @lc code=start
class Solution {
    func findTargetSumWays_1(_ nums: [Int], _ target: Int) -> Int {
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
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
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
// @lc code=end

