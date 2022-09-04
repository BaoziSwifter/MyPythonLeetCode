//
//  Leetcode283.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/8.
//

import Foundation

/**
 
 [283] 移动零
 
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 请注意 ，必须在不复制数组的情况下原地对数组进行操作。
**/

class Solution283 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var fast = 0, slow = 0
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
    func moveZeroes(_ nums: inout [Int]) {
        let index = removeElement(&nums, 0)
        for i in index..<nums.count {
            nums[i] = 0
        }
    }
}
