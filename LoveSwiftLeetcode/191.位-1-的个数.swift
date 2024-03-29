/*
 * @lc app=leetcode.cn id=191 lang=swift
 *
 * [191] 位1的个数
 */

// @lc code=start
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, res = 0
        while n > 0 {
            n &= (n - 1)
            res += 1
        }
        return res
    }
}
// @lc code=end

