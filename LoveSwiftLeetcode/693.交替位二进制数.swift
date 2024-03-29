/*
 * @lc app=leetcode.cn id=693 lang=swift
 *
 * [693] 交替位二进制数
 */

// @lc code=start
class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var lastVal: Int?
        var n = n
        while n > 0 {
            let tmp = n % 2
            n >>= 1
            if let l = lastVal {
                if l == tmp {
                    return false
                }
            }
            lastVal = tmp
        }
        return true
    }
}
// @lc code=end

