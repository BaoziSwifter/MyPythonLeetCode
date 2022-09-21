/*
 * @lc app=leetcode.cn id=263 lang=swift
 *
 * [263] 丑数
 */

// @lc code=start
class Solution {
    func isUgly(_ num: Int) -> Bool {
      if num < 1 { return false }
        var n = num
        while n%2 == 0 { n/=2 }
        while n%3 == 0 { n/=3 }
        while n%5 == 0 { n/=5 }
        return n == 1
    }
}
// @lc code=end

