/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 */

// @lc code=start
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var left = 1
        var i = 0
        let cnt = digits.count
        while i < cnt {
            let value = digits[cnt - 1 - i] + left
            digits[cnt - 1 - i] = value % 10
            left = value / 10 
            i += 1
        }
        if left == 1 {
            digits.insert(1, at: 0)
        }

        return digits

    }
}
// @lc code=end

