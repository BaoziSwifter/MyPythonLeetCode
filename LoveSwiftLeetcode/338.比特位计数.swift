/*
 * @lc app=leetcode.cn id=338 lang=swift
 *
 * [338] 比特位计数
 */

// @lc code=start
class Solution {
    func countBits(_ n: Int) -> [Int] {
        var res = [Int](repeating: 0, count: n + 1)
        var i = 1
        while i <= n {
            res[i] = res[i>>1] + i&1
            i += 1
        }
        return res
    }
}
// @lc code=end

