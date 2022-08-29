//
//  47.全排列-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/29.
//

import Foundation

class Solution47 {
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
