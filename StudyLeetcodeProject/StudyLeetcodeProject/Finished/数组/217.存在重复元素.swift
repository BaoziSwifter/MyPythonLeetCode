//
//  217.-存在重复元素.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution217 {
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [Int: Int]()
        for i in nums {
            if map[i, default: 0] > 0 {
                return true
            } else {
                map[i, default: 0] += 1
            }
        }
        return false
    }
}
