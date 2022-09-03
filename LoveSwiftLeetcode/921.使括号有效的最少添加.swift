/*
 * @lc app=leetcode.cn id=921 lang=swift
 *
 * [921] 使括号有效的最少添加
 */

// @lc code=start
class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var res = 0 // 记录插入次数
        var need = 0 // 记录右括号的需求
        for c in s {
            if c == "(" {
                need += 1
            }
            if c == ")" {
                need -= 1
                if need == -1 {
                    need = 0
                    // 需要插入一个左括号
                    res += 1
                }
            }
        }
        return res + need
    }
}
// @lc code=end

