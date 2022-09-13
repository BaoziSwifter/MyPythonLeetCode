/*
 * @lc app=leetcode.cn id=88 lang=swift
 *
 * [88] 合并两个有序数组
 */

// @lc code=start
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var le = m - 1, re = n - 1
        var ai = m + n - 1
        while re >= 0 {
            if le >= 0 && nums1[le] > nums2[re] {
                nums1[ai] = nums1[le]
                ai -= 1
                le -= 1
            } else {
                nums1[ai] = nums2[re]
                ai -= 1
                re -= 1
            }
        }
    }
}
// @lc code=end

