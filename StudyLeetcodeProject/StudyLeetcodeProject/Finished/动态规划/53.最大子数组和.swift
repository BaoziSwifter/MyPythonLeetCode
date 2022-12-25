//
//  53.-最大子数组和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        let cnt = nums.count
        if cnt == 0 { return 0 }
        var dp = [Int](repeating: 0, count: cnt)
        dp[0] = nums[0]
        var res = dp[0]
        for i in 1..<cnt {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            res = max(res, dp[i])
        }
        return res
    }
}
