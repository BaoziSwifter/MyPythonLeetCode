//
//  581.-最短无序连续子数组.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution581 {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        let tmp = nums.sorted()
        var left = 0, right = nums.count - 1
        while tmp[left] == nums[left], left < right { left += 1 }
        while tmp[right] == nums[right], left < right { right -= 1 }
        if left == right { return 0 }
        return right - left + 1
    }
    
    // 单调栈
    func findUnsortedSubarray_singleStack(_ nums: [Int]) -> Int {
        var stack = [Int]()
        var left = Int.max
        for (i, n) in nums.enumerated() {
            while !stack.isEmpty, n < nums[stack.last!] {
                left = min(stack.popLast()!, left)
            }
            stack.append(i)
        }
        if left == Int.max { return 0 }
        var right = Int.min
        stack = []
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            while !stack.isEmpty && nums[i] > nums[stack.last!] {
                right = max(right, stack.popLast()!)
            }
            stack.append(i)
        }
        return right - left + 1
    }
    
    func findUnsortedSubarray_singleStack_2(_ nums: [Int]) -> Int {
        var curMin = Int.max
        var curMax = Int.min
        for i in 0..<nums.count {
            let j = nums.count - 1 - i
            if i > 0 && nums[i] < nums[i-1] {
                curMin = min(curMin, nums[i])
            }
            if j < nums.count - 1 && nums[j] > nums[j+1] {
                curMax = max(curMax, nums[j])
            }
        }
        // seek
        var l = -1
        var r = -1
        for i in 0..<nums.count {
            let j = nums.count - 1 - i
            if curMin < nums[i] && l == -1 {
                l = i
            }
            if curMax > nums[j] && r == -1 {
                r = j
            }
        }
        if curMin == Int.max && curMax == Int.min {
            return 0
        }
        return r - l + 1
    }

}
