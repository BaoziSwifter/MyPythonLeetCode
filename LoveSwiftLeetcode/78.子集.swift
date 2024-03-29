/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 */

// @lc code=start
class Solution {
    var res = [[Int]]()
    var track = [Int]()
    func subsets(_ nums: [Int]) -> [[Int]] {
        backtrack(nums, 0)
        return res
    }
    
    func backtrack(_ nums: [Int], _ start: Int) {
        res.append(track)
        for i in start ..< nums.count {
            track.append(nums[i])
            backtrack(nums, i + 1)
            track.removeLast()
        }
    }
}
// @lc code=end

