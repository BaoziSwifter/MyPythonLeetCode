/*
 * @lc app=leetcode.cn id=75 lang=swift
 *
 * [75] 颜色分类
 */

// @lc code=start
class Solution {
    func sortColors_for_2(_ nums: inout [Int]) {
        let n = nums.count
        var left = 0, right = n - 1
        while left < right {
            if nums[left] == 0 {
                left += 1
                continue
            }
            if nums[right] != 0 {
                right -= 1
                continue
            }
            if nums[left] != 0 , nums[right] == 0 {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }
        right = n - 1
        while left < right {
            if nums[left] != 2 {
                left += 1
                continue
            }
            if nums[right] == 2 {
                right -= 1
                continue
            }
            if nums[left] != 2, nums[right] == 2 {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }
    }
    func sortColors(_ nums: inout [Int]) {
        let n = nums.count
        var index = 0
        var i = 0
        while i < n {
            if nums[i] == 0 {
                nums.swapAt(i, index)
                index += 1
            }
            i += 1
        }
        i = index
        while i < n {
            if nums[i] == 1 {
                nums.swapAt(i, index)
                index += 1
            }
            i += 1
        }
    }
}
// @lc code=end

