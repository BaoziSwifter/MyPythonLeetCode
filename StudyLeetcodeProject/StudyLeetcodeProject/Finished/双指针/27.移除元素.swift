//
//  Leetcode27.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/8.
//

import Foundation

/**
 [27] 移除元素
 
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
 */

class Solution27 {
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
}
