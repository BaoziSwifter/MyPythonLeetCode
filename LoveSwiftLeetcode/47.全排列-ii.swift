/*
 * @lc app=leetcode.cn id=47 lang=swift
 *
 * [47] 全排列 II
 */

// @lc code=start
class Solution {
    var res = [[Int]]()
    var used = [Int: Bool]()
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var track = [Int]()
        backtrace(nums, &track)
        return res
    }
    func backtrace( _ nums: [Int], _ track: inout [Int]) {
        if track.count == nums.count {
            res.append(track)
            return
        }
        
        for i in 0 ..< nums.count {
            if let u = used[i], u == true { continue }
            if i > 0, nums[i] == nums[i - 1], let u = used[i - 1], u == false {
                continue
            }
            track.append(nums[i])
            used[i] = true
            backtrace(nums, &track)
            track.removeLast()
            used[i] = false
        }
    }
}
// @lc code=end

