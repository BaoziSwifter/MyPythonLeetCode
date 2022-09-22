/*
 * @lc app=leetcode.cn id=326 lang=swift
 *
 * [326] 3 的幂
 */

// @lc code=start
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var n = n
        while n>0 && n%3==0 {
            n = n/3
        }
        return n==1
    }
}
// @lc code=end

