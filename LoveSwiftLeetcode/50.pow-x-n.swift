/*
 * @lc app=leetcode.cn id=50 lang=swift
 *
 * [50] Pow(x, n)
 */

// @lc code=start
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        let half = myPow(x, n / 2)
        return half * half * ( n % 2 == 1 ? x : 1)
    }
}
// @lc code=end

