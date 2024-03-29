/*
 * @lc app=leetcode.cn id=476 lang=swift
 *
 * [476] 数字的补数
 */

// @lc code=start
class Solution {
    func findComplement(_ num: Int) -> Int {
        var i = 1
        while i <= num {
            i = i << 1
        }
        return i - 1 - num
    }
}
// @lc code=end

