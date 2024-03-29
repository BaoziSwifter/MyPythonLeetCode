/*
 * @lc app=leetcode.cn id=128 lang=swift
 *
 * [128] 最长连续序列
 */

// @lc code=start
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let setNums = Set(nums)
        var mapNums = Set<Int>()
        var res = 0
        for item in setNums {
            if mapNums.contains(item) {
                continue
            }
            if setNums.contains(item - 1) {
                continue
            }
            var index = item
            var count = 0
            while setNums.contains(index) {
                mapNums.insert(index)
                index += 1
                count += 1
            }
            res = max(res, count)
        }
        return res
    }
}
// @lc code=end

