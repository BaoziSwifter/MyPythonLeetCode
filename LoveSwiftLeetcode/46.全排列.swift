/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 */

// @lc code=start
class Solution {
    var res = [[Int]]()
    func permute(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        var used = [Bool](repeating: false, count: nums.count)
        backTrack(nums, &track, &used)
        return res
    }
    func backTrack(_ nums: [Int], _ track: inout [Int], _ used: inout [Bool]) {
        if nums.count == track.count {
            res.append(track)
            return
        }
        for i in 0 ..< nums.count {
            if used[i] {
                continue
            }
            track.append(nums[i])
            used[i] = true
            backTrack(nums, &track, &used)
            track.removeLast()
            used[i] = false
        }
    }
}
// @lc code=end

