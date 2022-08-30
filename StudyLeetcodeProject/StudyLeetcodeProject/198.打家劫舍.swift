//
//  198.-打家劫舍.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        var last = 0, now = 0
        for i in nums {
            (last, now) = (now, max(last + i, now))
        }
        return now
    }
    // dp[0] = nums[0]
    // dp[1] = max(nums[0], nums[1])
    // dp[i] = max(dp[i-2] + nums[i], dp[i-1])
    func rob_dp(_ nums: [Int]) -> Int {
        let cnt = nums.count
        if cnt <= 0 { return 0 }
        if cnt == 1 { return nums[0] }
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<cnt {
            dp[i] = max(dp[i-1], nums[i] + dp[i-2])
        }
        return dp[cnt-1]
    }
}
