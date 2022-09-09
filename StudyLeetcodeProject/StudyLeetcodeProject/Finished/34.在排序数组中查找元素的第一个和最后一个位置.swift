//
//  34.-在排序数组中查找元素的第一个和最后一个位置.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution34 {
    // 法1
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0, right = nums.count - 1
        while left < right {
            if nums[left] == target && nums[right] == target {
                return [left, right]
            } else if nums[left] < target && nums[right] > target {
                left += 1
                right -= 1
            } else if nums[left] < target {
                left += 1
            } else if nums[right] > target {
                right -= 1
            } else {
                break
            }
        }
        return [-1, -1]
    }
    
    // 法2
    func searchRange_inner(_ nums: [Int], _ target: Int) -> [Int] {
        let firstIndex = nums.firstIndex(of: target) ?? -1
        let lastIndex = nums.lastIndex(of: target) ?? -1
        return [firstIndex,lastIndex]
    }
    
    // 法3
    func searchRange_bin(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0, right = nums.count - 1
        func searchLeftBound(_ l: Int, _ r: Int) -> Int {
            var l = l, r = r
            while l <= r {
                let mid = (l + r) / 2
                if target > nums[mid] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return l
        }
        
        func searchRightBound(_ l: Int, _ r: Int) -> Int {
            var l = l, r = r
            while l <= r {
                let mid = (l + r) / 2
                if target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            return r
        }
        
        while left <= right {
            if nums[left] > target && nums[right] < target {
                return [-1, -1]
            }
            let mid = (right - left) / 2 + left
            if nums[mid] == target {
                let l = searchLeftBound(left, mid)
                let r = searchRightBound(mid, right)
                return [l, r]
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return [-1, -1]
    }
}
