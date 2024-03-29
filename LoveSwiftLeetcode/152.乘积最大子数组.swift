/*
 * @lc app=leetcode.cn id=152 lang=swift
 *
 * [152] 乘积最大子数组
 */

// @lc code=start
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxF = nums[0], minF = nums[0], res = nums[0]
        for i in 1..<nums.count {
            let mx = maxF, mn = minF
            maxF = max(mx*nums[i], max(nums[i], mn * nums[i]))
            minF = min(mn * nums[i], min(nums[i], mx * nums[i]))
            res = max(maxF, res)
        }
        return res
    }
}
// @lc code=end

