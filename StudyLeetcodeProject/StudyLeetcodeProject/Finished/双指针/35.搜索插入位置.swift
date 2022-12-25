//
//  35.-搜索插入位置.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
