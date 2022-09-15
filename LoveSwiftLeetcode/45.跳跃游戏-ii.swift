/*
 * @lc app=leetcode.cn id=45 lang=swift
 *
 * [45] 跳跃游戏 II
 */

// @lc code=start
class Solution {
    func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        var end = 0, farthest = 0
        var jumps = 0
        for i in 0..<n-1 {
            farthest = max(nums[i] + i, farthest)
            if end == i {
                jumps += 1
                end = farthest
            }
        }
        return jumps
    }
}
// @lc code=end

