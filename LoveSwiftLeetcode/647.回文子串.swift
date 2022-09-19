/*
 * @lc app=leetcode.cn id=647 lang=swift
 *
 * [647] 回文子串
 */

// @lc code=start
class Solution {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var count = 0
        for i in 0..<s.count {
            // 奇数回文
            var left = i
            var right = i
            while left >= 0, right < s.count, s[left] == s[right] {
                left -= 1
                right += 1
                count += 1
            }
            
            // 偶数回文
            left = i
            right = i + 1
            while left >= 0, right < s.count, s[left] == s[right] {
                left -= 1
                right += 1
                count += 1
            }
        }
        return count
    }
}
// @lc code=end

