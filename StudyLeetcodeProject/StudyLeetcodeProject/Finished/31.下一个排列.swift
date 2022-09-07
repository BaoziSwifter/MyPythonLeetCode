//
//  31.-下一个排列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution31 {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 1, j = i
        // 从后往前找到第一个降序的下标
        while i > 0, nums[i - 1] >= nums[i] { i -= 1 }
        // 如果找到开头都没找到， 则证明这个数组是降序的， 直接翻转就是最小的
        if i <= 0 { nums = nums.reversed(); return }
        // 再次从后往前找 找到这个升序i-1...j中第一个大于i-1位置的下标
        while j > i, nums[j] <= nums[i - 1] { j -= 1 }
        // 交换
        nums.swapAt(i - 1, j)
        // 【4, 5, 3, 6, 2, 1】
        nums = nums[..<i] + nums[i...].reversed()
    }
}
