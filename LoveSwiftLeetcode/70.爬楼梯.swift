/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 */

// @lc code=start
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var pre = 0
        var next = 1
        for _ in 0...n {
            (pre, next) = (next, pre + next)
        }
        return pre
    }
}
// @lc code=end

