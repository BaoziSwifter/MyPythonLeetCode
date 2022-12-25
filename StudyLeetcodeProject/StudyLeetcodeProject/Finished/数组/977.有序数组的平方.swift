//
//  977.-有序数组的平方.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution977 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var left = 0, right = nums.count - 1
        var pos = right
        var res = [Int](repeating: 0, count: nums.count)
        while left <= right {
            if nums[left] * nums[left] > nums[right] * nums[right] {
                res[pos] = nums[left] * nums[left]
                left += 1
            } else {
                res[pos] = nums[right] * nums[right]
                right -= 1
            }
            pos -= 1
        }
        return res
    }
}
