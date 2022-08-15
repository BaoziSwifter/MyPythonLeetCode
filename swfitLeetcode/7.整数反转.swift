/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class ReverseIntSolution {
    func reverse(_ x: Int) -> Int {
        var l = 0;
        var sum = 0
        var x = x
        while x != 0 {
            l = x%10
            sum=sum*10+l
            x = x / 10
        }
        if sum > 2147483647 || sum < -2147483647 {
            sum = 0
        }
        return sum
    }
}
// @lc code=end

