/*
 * @lc app=leetcode.cn id=560 lang=swift
 *
 * [560] 和为 K 的子数组
 */

// @lc code=start
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var preSum = [Int: Int]()
        var sum = 0
        for i in 0 ..< nums.count {
            sum += nums[i]
            if sum == k { res += 1 }
            if let count = preSum[sum - k] {
                res += count
            }
            preSum[sum, default: 0] += 1
        }
        return res
    }
}
// @lc code=end

