/*
 * @lc app=leetcode.cn id=258 lang=swift
 *
 * [258] 各位相加
 */

// @lc code=start
class Solution {
    func addDigits(_ num: Int) -> Int {
        var num = num
        while num >= 10 {
            var tmpSum = 0
            while num > 0 {
                tmpSum += (num % 10)
                 num /= 10
            }
            num = tmpSum
        }
        return num
    }
}
// @lc code=end

