//
//  704.-二分查找.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var res = -1
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                res = mid
                break
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return res
    }
}
