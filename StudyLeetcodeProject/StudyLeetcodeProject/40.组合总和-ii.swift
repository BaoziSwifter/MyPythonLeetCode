//
//  40.组合总和-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/29.
//

import Foundation

class Solution40 {
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
