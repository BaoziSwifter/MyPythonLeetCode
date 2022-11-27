//
//  16.-最接近的三数之和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution16 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 { return 0 }
        var delta = Int.max
        let nums = nums.sorted()
        for i in 0..<(nums.count - 2) {
            // 固定起始的i
            let closethreeSum = twoSunCloseset(nums, target - nums[i], i+1) + nums[i]
            if abs(delta) > abs(closethreeSum - target) {
                delta = target - closethreeSum
            }
        }
        return target - delta
    }
    func twoSunCloseset(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var l = start, r = nums.count - 1
        var delta = Int.max
        while l < r {
            let tempSum = nums[l] + nums[r]
            if abs(tempSum - target) < abs(delta) {
                delta = target - tempSum
            }
            if tempSum < target {
                l += 1
            }
            else {
                r -= 1
            }
        }
        return target - delta
    }
}
