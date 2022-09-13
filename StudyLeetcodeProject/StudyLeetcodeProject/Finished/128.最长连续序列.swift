//
//  128.-最长连续序列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution128 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let setNums = Set(nums)
        var mapNums = Set<Int>()
        var res = 0
        for item in setNums {
            if mapNums.contains(item) {
                continue
            }
            if setNums.contains(item - 1) {
                continue
            }
            var index = item
            var count = 0
            while setNums.contains(index) {
                mapNums.insert(index)
                index += 1
                count += 1
            }
            res = max(res, count)
        }
        return res
    }
}
