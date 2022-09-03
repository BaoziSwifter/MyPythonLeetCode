/*
 * @lc app=leetcode.cn id=215 lang=swift
 *
 * [215] 数组中的第K个最大元素
 */

// @lc code=start
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let cnt = nums.count
        if k > cnt {
            return 0
        }
        let tmp = nums.sorted()
        return tmp[cnt-k]
    }
}
// @lc code=end

