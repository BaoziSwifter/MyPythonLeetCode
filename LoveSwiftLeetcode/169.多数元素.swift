/*
 * @lc app=leetcode.cn id=169 lang=swift
 *
 * [169] 多数元素
 */

// @lc code=start
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var hashMap = [Int: Int]()
        let cnt = nums.count
        for i in nums {
            hashMap[i, default: 0] += 1
            if hashMap[i]! > cnt / 2 {
                return i
            }
        }
        return nums[0]
    }
}
// @lc code=end

