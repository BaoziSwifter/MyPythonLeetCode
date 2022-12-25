//
//  287.-寻找重复数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution287 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = 0 , slow = 0
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while fast != slow
        slow = 0
        while slow != fast{
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}
