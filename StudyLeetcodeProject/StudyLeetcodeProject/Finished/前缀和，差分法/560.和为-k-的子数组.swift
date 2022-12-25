//
//  560.-和为-k-的子数组.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution560 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var preSum = [Int: Int]()
        var sum = 0
        for i in 0 ..< nums.count {
            sum += nums[i]
            if sum == k { res += 1 }
            if let count = preSum[sum - k] {
                res += count
            }
            preSum[sum, default: 0] += 1
        }
        return res
    }
}
