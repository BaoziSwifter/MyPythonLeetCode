//
//  268.-丢失的数字.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution268 {
    func missingNumber(_ nums: [Int]) -> Int {
        var result: Int = nums.count
        for i in 0 ..< nums.count {
            result ^= i
            result ^= nums[i]
        }
        return result
    }
}
