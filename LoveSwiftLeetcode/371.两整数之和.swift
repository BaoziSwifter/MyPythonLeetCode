/*
 * @lc app=leetcode.cn id=371 lang=swift
 *
 * [371] 两整数之和
 */

// @lc code=start
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
            let sumNoCarry = a ^ b
            let carry = (a & b) << 1
            a = sumNoCarry
            b = carry
        }
        return a
    }
}
// @lc code=end

