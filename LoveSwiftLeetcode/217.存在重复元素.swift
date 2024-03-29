/*
 * @lc app=leetcode.cn id=217 lang=swift
 *
 * [217] 存在重复元素
 */

// @lc code=start
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [Int: Int]()
        for i in nums {
            if map[i, default: 0] > 0 {
                return true
            } else {
                map[i, default: 0] += 1
            }
        }
        return false

    }
}
// @lc code=end

