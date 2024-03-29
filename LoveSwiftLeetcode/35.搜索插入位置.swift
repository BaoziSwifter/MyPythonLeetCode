/*
 * @lc app=leetcode.cn id=35 lang=swift
 *
 * [35] 搜索插入位置
 */

// @lc code=start
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
// @lc code=end

