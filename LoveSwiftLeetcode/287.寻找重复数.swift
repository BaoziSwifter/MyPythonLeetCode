/*
 * @lc app=leetcode.cn id=287 lang=swift
 *
 * [287] 寻找重复数
 */

// @lc code=start
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count - 1
        let realSum = nums.reduce(0){ $0 + $1 }
        let n21Sum = Int(Double(n + 1)/2.0*Double(n))
        return realSum - n21Sum
    }
}
// @lc code=end

