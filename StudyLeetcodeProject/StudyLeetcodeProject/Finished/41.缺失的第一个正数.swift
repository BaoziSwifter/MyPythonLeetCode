//
//  41.-缺失的第一个正数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution41 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] > 0 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        
        for i in 0 ..< nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}
