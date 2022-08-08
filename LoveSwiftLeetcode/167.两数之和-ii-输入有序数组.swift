/*
 * @lc app=leetcode.cn id=167 lang=swift
 *
 * [167] 两数之和 II - 输入有序数组
 */

// @lc code=start
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return [-1, -1]
    }
}
// @lc code=end

