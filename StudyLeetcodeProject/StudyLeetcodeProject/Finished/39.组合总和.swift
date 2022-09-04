//
//  39.-组合总和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution39 {
    var res = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var track = [Int]()
        backtrace(candidates, 0, target, &track)
        return res
    }
    
    func backtrace(_ nums: [Int], _ start: Int, _ target: Int, _ track: inout [Int]) {
        if target == 0 {
            res.append(track)
            return
        }
        
        for i in start ..< nums.count {
            let t = target - nums[i]
            if t >= 0 {
                track.append(nums[i])
                backtrace(nums, i, t, &track)
                track.removeLast()
            }
        }
    }
}
