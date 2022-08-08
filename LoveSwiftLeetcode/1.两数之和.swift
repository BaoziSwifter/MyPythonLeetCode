/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexValue = [Int: Int]()
        for i in 0..<nums.count {
            guard let index = indexValue[target - nums[i]] else {
                indexValue[nums[i]] = i
                continue
            }
            return [index, i]
        }
        return []
    }
}
// @lc code=end

