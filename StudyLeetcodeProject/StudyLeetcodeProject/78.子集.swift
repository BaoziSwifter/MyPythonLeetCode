//
//  78.-子集.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution78 {
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
