//
//  18.-四数之和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution18 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        func nSum(_ nums: [Int], _ target: Int, _ nNum: Int, _ start: Int) -> [[Int]] {
            var nRes = [[Int]]()
            if nNum < 2 {
                return nRes
            }
            if nNum == 2 {
                var l = start, r = nums.count - 1
                while l < r {
                    let left = nums[l], right = nums[r]
                    let twoSum = left + right
                    if target == twoSum {
                        nRes.append([left, right])
                        while l < r && nums[l] == left { l += 1 }
                        while l < r && nums[r] == right { r -= 1 }
                    } else if target < twoSum {
                        while l < r && nums[r] == right { r -= 1 }
                    } else {
                        while l < r && nums[l] == left { l += 1 }
                    }
                }
            } else {
                var i = start
                while i < nums.count {
                    let tempRes = nSum(nums, target - nums[i], nNum - 1, i + 1)
                    for j in 0..<tempRes.count {
                        var a = tempRes[j]
                        a.append(nums[i])
                        nRes.append(a)
                    }
                    let left = nums[i]
                    i += 1
                    while i < nums.count && left == nums[i] { i += 1 }
                }
            }
            return nRes
        }
        
        
        return nSum(nums, target, 4, 0)
    }
}
