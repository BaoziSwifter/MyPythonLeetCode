/*
 * @lc app=leetcode.cn id=27 lang=swift
 *
 * [27] 移除元素
 */

// @lc code=start
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var fast = 0, slow = 0
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
}
// @lc code=end

