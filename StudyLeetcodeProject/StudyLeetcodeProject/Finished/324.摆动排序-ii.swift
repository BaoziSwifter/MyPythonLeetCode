//
//  324.-摆动排序-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution324 {
    func wiggleSort(_ nums: inout [Int]) {
        let cnt = nums.count
        let arr = nums.sorted()
        let mid = (cnt + 1) / 2
        var begin = mid - 1
        var end = cnt - 1
        var i = 0
        while i < cnt {
            nums[i] = arr[begin]
            if i + 1 < cnt {
                nums[i + 1] = arr[end]
            }
            begin -= 1
            end -= 1
            i += 2
        }
    }
}
