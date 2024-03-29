/*
 * @lc app=leetcode.cn id=561 lang=swift
 *
 * [561] 数组拆分
 */

// @lc code=start
class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let numss = nums.sorted()
        var start = 0
        var res = 0
        while start < nums.count {
            res += numss[start]
            start += 2
        }
        return res
    }
}
// @lc code=end

