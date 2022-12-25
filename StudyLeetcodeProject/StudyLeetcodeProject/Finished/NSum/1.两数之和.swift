//
//  1.两数之和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/8.
//

import Foundation

/**
 [1] 两数之和
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 */

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexValue = [Int: Int]()
        for i in 0..<nums.count {
            guard let index = indexValue[target - nums[i]] else {
                indexValue[nums[i]] = i
                continue
            }
            return [index, i]
        }
        return []
    }
}
