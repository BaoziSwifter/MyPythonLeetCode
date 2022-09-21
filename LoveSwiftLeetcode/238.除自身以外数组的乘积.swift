/*
 * @lc app=leetcode.cn id=238 lang=swift
 *
 * [238] 除自身以外数组的乘积
 */

// @lc code=start
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: nums.count)
        var tmp = 1
        for i in  0 ..< nums.count {
            res[i] = tmp
            tmp *= nums[i]
        }
        
        tmp = 1
        for i in (0 ..< nums.count).reversed() {
            res[i] *= tmp
            tmp *= nums[i]
        }
        return res
    }
}
// @lc code=end

