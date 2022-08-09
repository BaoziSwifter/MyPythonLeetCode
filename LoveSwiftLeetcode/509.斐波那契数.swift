/*
 * @lc app=leetcode.cn id=509 lang=swift
 *
 * [509] 斐波那契数
 */

// @lc code=start
class Solution {
    func fib(_ n: Int) -> Int {
        var l = 0, r = 1
        for _ in 0..<n {
            (l, r) = (r, r + l)
        }
        return l
    }
}
// @lc code=end

