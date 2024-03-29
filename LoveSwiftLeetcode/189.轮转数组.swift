/*
 * @lc app=leetcode.cn id=189 lang=swift
 *
 * [189] 轮转数组
 */

// @lc code=start
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        if count < 2 {
            return
        }
        let realK = k % count
        for _ in 0 ..< realK {
            let temp = nums.popLast()!
            nums.insert(temp, at: 0)
        }
    }
}
// @lc code=end

