//
//  55.-跳跃游戏.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution55 {
    /**
     对于数组中的任意一个位置 y，我们如何判断它是否可以到达？根据题目的描述，只要存在一个位置 x，它本身可以到达，并且它跳跃的最大长度为 x+nums[x]，这个值大于等于 y，即 x+nums[x]≥y，那么位置 y 也可以到达
     对于每一个可以到达的位置 x，它使得 x+1, x+2,⋯,x+nums[x] 这些连续的位置都可以到达
     依次遍历数组中的每一个位置，并实时维护 最远可以到达的位置。对于当前遍历到的位置 x，如果它在 最远可以到达的位置 的范围内，那么我们就可以从起点通过若干次跳跃到达该位置，因此我们可以用 x+nums[x] 更新 最远可以到达的位置。
     在遍历的过程中，如果 最远可以到达的位置 大于等于数组中的最后一个位置，那就说明最后一个位置可达，我们就可以直接返回 True 作为答案。反之，如果在遍历结束后，最后一个位置仍然不可达，我们就返回 False 作为答案。

     */
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        var farthest = 0
        for i in 0..<n-1 {
            // 不断统计最远的距离
            farthest = max(farthest, i + nums[i])
            if farthest <= i {
                return false
            }
        }
        return farthest >= n - 1
    }
    
    /**
     核心点在于数组中元素为0时能否跳过
     dp数组记录nums[i]此时可以跳的最大步长，当走到某个i，步长<=0时，说明无法再向前
     */
    func canJump_dp(_ nums: [Int]) -> Bool {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        if dp[0] <= 0 { return nums.count == 1 }
        for i in 1..<n {
            dp[i] = max(dp[i-1] - 1, nums[i])
            if dp[i] <= 0, i < n - 1 {
                return false
            }
        }
        return true
    }
}
