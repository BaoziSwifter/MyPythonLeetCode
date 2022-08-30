/*
 * @lc app=leetcode.cn id=213 lang=swift
 *
 * [213] 打家劫舍 II
 */

// @lc code=start
class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 0 { return 0 }
        if n == 1 { return nums[0] }
        if n == 2 { return max(nums[0], nums[1]) }
        
        return max(robrange(Array(nums[0..<n-1])), robrange(Array(nums[1..<n])))
            
    }
    
    func robrange(_ nums: [Int]) -> Int {
        var last = 0, now = 0
        for i in nums {
            (last, now) = (now, max(last + i, now))
        }
        return now
    }
}
// @lc code=end

