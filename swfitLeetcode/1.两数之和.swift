/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        for (index, val) in nums.enumerated() {
            let t = target - val
            guard let r = map[t] else {
                map[val] = index
                continue
            }
            return [r,index]
        }
        return []
    }
}
// @lc code=end

