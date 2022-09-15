/*
 * @lc app=leetcode.cn id=55 lang=swift
 *
 * [55] 跳跃游戏
 */

// @lc code=start
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        var farthest = 0
        for i in 0..<n-1 {
            // 不断统计最远的距离
            farthest = max(farthest, i + nums[i])
            if farthest <= i {
                return false
            }
        }
        return farthest >= n - 1
    }
}
// @lc code=end

