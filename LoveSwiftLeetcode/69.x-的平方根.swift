/*
 * @lc app=leetcode.cn id=69 lang=swift
 *
 * [69] x 的平方根 
 */

// @lc code=start
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x <= 1 { return x }
        var res = x
        while res * res > x {
            res = (res + x/res)/2
        }
        return res
    }
}
// @lc code=end

