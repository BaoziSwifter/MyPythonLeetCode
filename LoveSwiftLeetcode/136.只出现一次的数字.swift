/*
 * @lc app=leetcode.cn id=136 lang=swift
 *
 * [136] 只出现一次的数字
 */

// @lc code=start
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for n in nums {
            res = res^n
        }
        return res
    }
}
// @lc code=end

