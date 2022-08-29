/*
 * @lc app=leetcode.cn id=40 lang=swift
 *
 * [40] 组合总和 II
 */

// @lc code=start
class Solution {
    var res = [[Int]]()
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var track = [Int]()
        let nums = candidates.sorted()
        backtrace(nums, &track, target, 0)
        return res
    }
    func backtrace(_ nums: [Int], _ track: inout [Int], _ target: Int, _ currentIndex: Int) {

        if target == 0 {
            res.append(track)
            return
        }
        if currentIndex >= nums.count { return }

        for i in currentIndex ..< nums.count {
            if i > currentIndex && nums[i] == nums[i - 1] { continue }
            let t = target - nums[i]
            if t >= 0 {
                track.append(nums[i])
                backtrace(nums, &track, t, i + 1)
                track.removeLast()
            }
        }
    }
}
// @lc code=end

