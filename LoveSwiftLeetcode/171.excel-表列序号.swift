/*
 * @lc app=leetcode.cn id=171 lang=swift
 *
 * [171] Excel 表列序号
 */

// @lc code=start
class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var res = 0
        for c in columnTitle {
            res *= 26
            res += (Int(c.asciiValue!) - 64)
        }
        return res
    }
}
// @lc code=end

