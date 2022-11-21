//
//  645.-错误的集合.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution645 {
    
    func findErrorNums_sort(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        let n = nums.count
        var res = [Int]()
        var pre = 0
        for i in nums {
            if i == pre {
                res.append(pre)
            } else if i - pre > 1 {
                res.append(pre + 1)
            }
            pre = i
        }
        
        if nums[n - 1] != n {
            res.append(n)
        }
        return res
    }
    
    func findErrorNums_hash(_ nums: [Int]) -> [Int] {
        var numsCount = [Int: Int]()
        for n in nums {
            numsCount[n, default: 0] += 1
        }
        var res = [-1, -1]
        for i in 1...nums.count {
            let count = numsCount[i, default: 0]
            if count == 2 {
                res[0] = i
            } else if count == 0 {
                res[1] = i
            }
        }
        return res
    }
    
    func findErrorNums_sum(_ nums: [Int]) -> [Int] {
        let sum = (1 + nums.count) * nums.count / 2
        var sum2 = 0
        var set2 = Set<Int>()
        var num1 = 0
        for num in nums {
            if num1 == 0 {
                if set2.contains(num) {
                    num1 = num
                }
                set2.insert(num)
            }
            sum2 += num
        }
        return [num1, num1 + (sum - sum2)]
    }
    
    /**
     https://leetcode.cn/problems/set-mismatch/solutions/857255/cuo-wu-de-ji-he-by-leetcode-solution-1ea4/
    
     */
}
