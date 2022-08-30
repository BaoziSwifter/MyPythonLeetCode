/*
 * @lc app=leetcode.cn id=198 lang=swift
 *
 * [198] 打家劫舍
 */

// @lc code=start
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var last = 0, now = 0
        for i in nums {
            (last, now) = (now, max(last + i, now))
        }
        return now
    }
}
// @lc code=end

