/*
 * @lc app=leetcode.cn id=22 lang=swift
 *
 * [22] 括号生成
 */

// @lc code=start
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        func trackback(_ s: inout String, _ left: Int = 0, _ right: Int = 0) {
            if s.count == 2 * n { res.append(s) }
            else {
                if left < n {
                    s.append("(")
                    trackback(&s, left + 1, right)
                    s.removeLast()
                }
                if left > right {
                    s.append(")")
                    trackback(&s, left, right + 1)
                    s.removeLast()
                }
            }
        }
        var s = ""
        trackback(&s)
        return res
    }
}
// @lc code=end

