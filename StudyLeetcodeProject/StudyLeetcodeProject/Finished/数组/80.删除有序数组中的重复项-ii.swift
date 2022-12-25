//
//  80.-删除有序数组中的重复项-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution80 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var start = 0
        var index = 0
        while index < nums.count {
            if nums[index] == nums[start] {
                index += 1
            } else {
                if index - start > 2 {
                    let count = index - start - 2
                    var i = 0
                    while i < count {
                        nums.remove(at: start)
                        i += 1
                    }
                    index = start + 2
                    start = index
                } else {
                    
                    start = index
                    index += 1
                }
            }
        }
        if index - start > 2 {
            let count = index - start - 2
            var i = 0
            while i < count {
                nums.remove(at: start)
                i += 1
            }
        }
//        print(nums)
        return nums.count
    }
}
