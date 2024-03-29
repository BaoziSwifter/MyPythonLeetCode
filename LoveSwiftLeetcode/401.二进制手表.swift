/*
 * @lc app=leetcode.cn id=401 lang=swift
 *
 * [401] 二进制手表
 */

// @lc code=start
class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var res = [String]()
        for h in 0..<12 {
            for m in 0..<60 {
                if h.nonzeroBitCount + m.nonzeroBitCount == turnedOn {
                    res.append("\(h)" + ":" + (m < 10 ? "0":"") + "\(m)")
                }
            }
        }
        return res
    }
}
// @lc code=end

