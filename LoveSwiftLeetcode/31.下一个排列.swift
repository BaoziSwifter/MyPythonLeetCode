/*
 * @lc app=leetcode.cn id=31 lang=swift
 *
 * [31] 下一个排列
 */

// @lc code=start
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 1, j = i
        while i > 0, nums[i - 1] >= nums[i] { i -= 1 }
        if i <= 0 { nums = nums.reversed(); return }
        while j > i, nums[j] <= nums[i - 1] { j -= 1 }
        nums.swapAt(i - 1, j)
        nums = nums[..<i] + nums[i...].reversed()
    }
}
// @lc code=end

