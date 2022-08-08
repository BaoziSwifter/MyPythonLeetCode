/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
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
    func moveZeroes(_ nums: inout [Int]) {
        let index = removeElement(&nums, 0)
        for i in index..<nums.count {
            nums[i] = 0
        }
    }
}
// @lc code=end

