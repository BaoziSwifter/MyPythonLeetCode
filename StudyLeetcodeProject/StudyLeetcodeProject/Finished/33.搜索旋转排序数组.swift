//
//  33.-搜索旋转排序数组.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        func searchIndex(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
            if left > right {
                return -1
            }
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }
            let left = searchIndex(nums, target, left, mid - 1)
            if left == -1 {
                return searchIndex(nums, target, mid + 1, right)
            }
            return left
        }
        return searchIndex(nums, target, 0, nums.count - 1)
    }
    
    func search_while(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 1 { return -1 }
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target { return mid }
            if nums[left] <= nums[mid] {
                if nums[left] <= target, nums[mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[mid] < target, nums[right] >= target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}
