//
//  75.-颜色分类.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution75 {
    func sortColors_for_2(_ nums: inout [Int]) {
        let n = nums.count
        var left = 0, right = n - 1
        while left < right {
            if nums[left] == 0 {
                left += 1
                continue
            }
            if nums[right] != 0 {
                right -= 1
                continue
            }
            if nums[left] != 0 , nums[right] == 0 {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }
        right = n - 1
        while left < right {
            if nums[left] == 2 {
                left += 1
                continue
            }
            if nums[right] != 2 {
                right -= 1
                continue
            }
            if nums[left] != 1, nums[right] == 1 {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }
    }
    
    func sortColors_for_2_1(_ nums: inout [Int]) {
        let n = nums.count
        var cur = 0
        var i = 0
        while i < n {
            if nums[i] == 0 {
                nums.swapAt(i, cur)
                cur += 1
            }
            i += 1
        }
        i = cur
        while i < n {
            if nums[i] == 1 {
                nums.swapAt(i, cur)
                cur += 1
            }
            i += 1
        }
    }
    
    func sortColors_two_points(_ nums: inout [Int]) {
        let n = nums.count
        var p0 = 0, p1 = 0
        for i in 0..<n {
            if nums[i] == 1 {
                nums.swapAt(p1, i)
                p1 += 1
            } else if nums[i] == 0 {
                nums.swapAt(i, p0)
                if p0 < p1 {
                    nums.swapAt(i, p1)
                }
                p0 += 1
                p1 += 1
            }
            
        }
    }
}
