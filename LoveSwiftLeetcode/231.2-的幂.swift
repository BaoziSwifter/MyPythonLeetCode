/*
 * @lc app=leetcode.cn id=231 lang=swift
 *
 * [231] 2 的幂
 */

// @lc code=start
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var n = n
        while n > 0 && n % 2 == 0 {
            n = n / 2
            
        }
        return n == 1
    }
}
// @lc code=end

