//
//  334.-递增的三元子序列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution334 {
    // 时间复杂度O(n) 空间复杂度O(n)
    func increasingTriplet_two(_ nums: [Int]) -> Bool {
        let cnt = nums.count
        guard cnt >= 3 else {
            return false
        }
        var leftMin = [Int](repeating: -1, count: cnt)
        var rightMax = [Int](repeating: -1, count: cnt)
        leftMin[0] = nums[0]
        for i in 1 ..< cnt {
            leftMin[i] = min(nums[i], leftMin[i-1])
        }
        rightMax[cnt - 1] = nums.last!
        for i in 1 ..< cnt {
            rightMax[cnt - 1 - i] = max(nums[cnt - 1 - i], rightMax[cnt - i])
        }
        for i in 1 ..< cnt-1 {
            if nums[i] > leftMin[i - 1] && nums[i] < rightMax[i + 1] {
                return true
            }
        }
        return false
    }
    
    // 时间复杂度O(n) 空间复杂度O(1)
    // 三元子序列的第一、二个数应该尽可能地小，
    func increasingTriplet_o1(_ nums: [Int]) -> Bool {
        let cnt = nums.count
        guard cnt >= 3 else {
            return false
        }
        var first = nums[0]
        var second = Int.max
        for i in 1..<cnt {
            if nums[i] > second {
                return true
            } else if nums[i] > first {
                second = nums[i]
            } else {
                first = nums[i]
            }
        }
        return false
    }
}
