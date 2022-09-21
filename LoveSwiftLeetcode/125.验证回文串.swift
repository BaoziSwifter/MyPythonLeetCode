/*
 * @lc app=leetcode.cn id=125 lang=swift
 *
 * [125] 验证回文串
 */

// @lc code=start
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let str = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        return str == String(str.reversed())
    }
}
// @lc code=end

