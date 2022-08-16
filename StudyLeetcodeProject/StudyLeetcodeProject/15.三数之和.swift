//
//  15.三数之和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation
class Solution15 {
    func threeSum_for3(_ nums: [Int]) -> [[Int]] {
        var res = Set<[Int]>()
        let cnt = nums.count
        for i in 0 ..< cnt {
            for j in (i+1) ..< cnt {
                for k in (j+1) ..< cnt {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        let item = [nums[i], nums[j], nums[k]].sorted()
                        res.insert(item)
                    }
                }
            }
        }
        return Array(res)
    }
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let cnt = nums.count
        if cnt < 3 { return [] }
        var nums = nums
        nums.sort()
        var res = [[Int]]()
        for i in 0 ..< (cnt - 2) {
            if nums[i] > 0 {
                break
            }
            if i > 0, nums[i-1] == nums[i] {
                continue
            }
            var l = i + 1
            var r = cnt - 1
            while l < r {
                let v = nums[i] + nums[l] + nums[r]
                if v == 0 {
                    res.append([nums[i], nums[l], nums[r]])
                    repeat {
                        l += 1
                    } while l < r && nums[l] == nums[l-1]
                    
                    repeat {
                        r -= 1
                    } while l < r && nums[r] == nums[r+1]
                } else if v < 0 {
                    repeat {
                        l += 1
                    } while l < r && nums[l] == nums[l - 1]
                } else {
                    repeat {
                        r -= 1
                    } while l < r && nums[r] == nums[r + 1]
                }
            }
        }
        return res
    }
}
