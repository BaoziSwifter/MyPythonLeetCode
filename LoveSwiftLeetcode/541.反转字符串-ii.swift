/*
 * @lc app=leetcode.cn id=541 lang=swift
 *
 * [541] 反转字符串 II
 */

// @lc code=start
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var chs = Array(s)
        for i in stride(from: 0, to: chs.count, by: 2 * k) {
            var left = i, right = min(chs.count - 1, left + k - 1)
            while left < right {
                (chs[left], chs[right]) = (chs[right], chs[left])
                left += 1
                right -= 1
            }
        }
        return String(chs)
    }
}
// @lc code=end

