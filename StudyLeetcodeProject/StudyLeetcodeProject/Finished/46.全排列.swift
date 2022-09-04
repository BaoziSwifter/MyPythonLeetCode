//
//  46.-全排列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution46 {
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
