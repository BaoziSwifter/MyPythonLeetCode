/*
 * @lc app=leetcode.cn id=287 lang=swift
 *
 * [287] 寻找重复数
 */

// @lc code=start
class FindDuplicateSolution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = 0 , slow = 0
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while fast != slow 
        slow = 0
        while slow != fast{
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}
// [1,2,3,4,5,6,7,8,9,3]

// @lc code=end

