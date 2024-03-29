/*
 * @lc app=leetcode.cn id=394 lang=swift
 *
 * [394] 字符串解码
 */

// @lc code=start
class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [(Int, String)]()
        var res = ""
        var muti = 0
        for c in s {
            if c == "[" {
                stack.append((muti, res))
                muti = 0
                res = ""
            } else if c == "]" {
                if let (cMuti, lastRes) = stack.popLast() {
                    res = lastRes + String(repeating: res, count: cMuti)
                }
            } else if c.isWholeNumber {
                muti = muti * 10 + c.wholeNumberValue!
            } else {
                res.append(c)
            }
        }
        return res
    }
}
// @lc code=end

