/*
 * @lc app=leetcode.cn id=416 lang=swift
 *
 * [416] 分割等和子集
 */

// @lc code=start
class Solution {
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
// @lc code=end

