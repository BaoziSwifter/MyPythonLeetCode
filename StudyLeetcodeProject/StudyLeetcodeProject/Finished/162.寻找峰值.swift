//
//  162.-寻找峰值.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution162 {
    func findPeakElement(_ nums: [Int]) -> Int {
        let cnt = nums.count
        var left = 0, right = cnt - 1
        func getIndexValue(_ i: Int) -> Int {
            if i < 0 || i >= cnt {
                return Int.min
            }
            return nums[i]
        }
        while left <= right {
            let mid = left + (right - left) / 2
            if getIndexValue(mid) > getIndexValue(mid - 1) && getIndexValue(mid) > getIndexValue(mid + 1) {
                return mid
            }
            if getIndexValue(mid) < getIndexValue(mid + 1) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}

