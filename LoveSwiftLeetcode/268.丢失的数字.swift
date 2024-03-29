/*
 * @lc app=leetcode.cn id=268 lang=swift
 *
 * [268] 丢失的数字
 */

// @lc code=start
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var result: Int = nums.count
        for i in 0 ..< nums.count {
            result ^= i
            result ^= nums[i]
        }
        return result
    }
}
// @lc code=end

