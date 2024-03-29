/*
 * @lc app=leetcode.cn id=709 lang=swift
 *
 * [709] 转换成小写字母
 */

// @lc code=start
class Solution {
    func toLowerCase(_ s: String) -> String {
        var res = [Character]()
        for c in s {
            let v = c.asciiValue!
            if v >= 65 && v <= 90 {
                let char = Character(Unicode.Scalar(v + 32))
                res.append(char)
            } else {
                res.append(c)
            }
        }
        return String(res)
    }
}
// @lc code=end

