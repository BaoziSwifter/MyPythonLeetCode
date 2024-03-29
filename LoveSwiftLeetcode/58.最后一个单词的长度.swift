/*
 * @lc app=leetcode.cn id=58 lang=swift
 *
 * [58] 最后一个单词的长度
 */

// @lc code=start
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var result = 0
        for w in s.reversed() {
            if w != " " {
                result += 1
            } else if result > 0 {
                break
            }
        }
        return result
    }
}
// @lc code=end

