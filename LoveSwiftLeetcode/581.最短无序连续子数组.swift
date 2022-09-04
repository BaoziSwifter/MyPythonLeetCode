/*
 * @lc app=leetcode.cn id=581 lang=swift
 *
 * [581] 最短无序连续子数组
 */

// @lc code=start
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        let tmp = nums.sorted()
        var left = 0, right = nums.count - 1
        while tmp[left] == nums[left], left < right { left += 1 }
        while tmp[right] == nums[right], left < right { right -= 1 }
        if left == right { return 0 }
        return right - left + 1
    }
}
// @lc code=end

