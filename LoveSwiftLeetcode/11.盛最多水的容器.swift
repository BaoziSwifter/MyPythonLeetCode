/*
 * @lc app=leetcode.cn id=11 lang=swift
 *
 * [11] 盛最多水的容器
 */

// @lc code=start
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxVal = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            if height[left] < height[right] {
                let erae = height[left] * (right - left)
                maxVal = max(erae, maxVal)
                left += 1
            } else {
                let erae = height[right] * (right - left)
                maxVal = max(erae, maxVal)
                right -= 1
            }
        }
        return maxVal
    }
}
// @lc code=end

