/*
 * @lc app=leetcode.cn id=1541 lang=swift
 *
 * [1541] 平衡括号字符串的最少插入次数
 */

// @lc code=start
class Solution {
    func minInsertions(_ s: String) -> Int {
        var res = 0, need = 0
        for c in s {
            if c == "(" {
                need += 2
                if need % 2 == 1 {
                    res += 1
                    need -= 1
                }
            }
            if c == ")" {
                need -= 1
                if need == -1 {
                    res += 1
                    need = 1
                }
            }
        }
        return res + need
    }
}
// @lc code=end

