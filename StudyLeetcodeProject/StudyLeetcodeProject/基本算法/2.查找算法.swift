//
//  2.查找算法.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation

// 基本的二分搜索
func baseBinarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = left + ( right - left) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            right = mid - 1
        } else if nums[mid] < target {
            left = mid + 1
        }
    }
    return -1
}

// 寻找左侧便捷的二分搜索[0, N)
func leftBoundary_BinarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count
    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            right = mid
        } else if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid
        }
    }
    return left
}

// 寻找左侧便捷的二分搜索[0, N]
func leftInBoundary_BinarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid - 1
        } else if nums[mid] == target {
            right = mid - 1
        }
    }
    // 判断 target 是否存在于 nums 中
    // 此时 target 比所有的数都大 返回-1
    if left == nums.count { return -1 }
    // 判断一下 nums[left] 是不是 target
    return nums[left] == target ? left : -1
}

// 寻找右侧便捷的二分查找[0, N)
func rigt_Boundary_BinarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count
    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            left = mid + 1
        } else if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid
        }
    }
    return left - 1
}

func rigt_InBoundary_BinarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            left = mid + 1
        } else if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid - 1
        }
    }
    if left - 1 < 0 { return -1 }
    return nums[left - 1] == target ? (left - 1) : -1
}
