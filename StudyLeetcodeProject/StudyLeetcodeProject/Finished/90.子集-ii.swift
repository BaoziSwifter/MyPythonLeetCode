//
//  90.子集-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/29.
//

import Foundation

class Solution90 {
    var res = [[Int]]()
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        let nums = nums.sorted()
        backtrace(nums, &track, 0)
        return res
    }
    func backtrace(_ nums: [Int], _ track: inout [Int], _ index: Int) {
        res.append(track)
        for i in index ..< nums.count {
            if i > index && nums[i] == nums[i - 1] {
                continue
            }
            track.append(nums[i])
            backtrace(nums, &track, i + 1)
            track.removeLast()
        }
    }
}
