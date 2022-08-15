/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var sum = 0
        while x != 0 {
            sum = sum * 10 + (x % 10)
            x = x / 10
        }
        if sum > 2147483647 || sum < -2147483647 {
            sum = 0
        }
        return sum
    }
}
// @lc code=end

