//
//  300.-最长递增子序列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution300 {
    // 动态规划
    // 定义 dp[i] 为考虑前 i 个元素，以第 i 个数字结尾的最长上升子序列的长度，注意 nums[i] 必须被选取
    // 从小到大计算dp数组的值 计算dp[i]之前， 已经dp[0..i-1]的值
    // 状态转转移方程为：dp[i] = max(dp[j]) + 1, 其中 0<=j<i 且 nums[j]<nums[i]
    // 考虑到dp[0...i-1] 中最长的上升子序列后面再加一个nums[i], 由于dp[j]代表nums[0...j]中以nums[j]结尾的最长上升子序列
    // 所以如果能从dp[j]这个状态转移过来，那么nums[i]必然要大于nums[j],才能将nums[i]放在nums[j]后面以形成更长的上升子序列
    // LIS(length) = max(dp[i]), 0<=i<=n
    func lengthOfLIS_dp(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = 1
        var res = 1
        for i in 1..<nums.count {
            dp[i] = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
    /**
     时间复杂度：O(n^2)，其中 n 为数组 nums 的长度。动态规划的状态数为 n，计算状态 dp[i] 时，需要 O(n) 的时间遍历dp[0…i−1] 的所有状态，所以总时间复杂度为 O(n^2)。
     空间复杂度：O(n)，需要额外使用长度为 n 的 dp 数组。
     */
    
    
    /**
     维护一个数字d[i],表示长度为i的最长上升子序列的末尾元素的最小值，用len记录目前最长上升子序列的长度， 其实为len = 1,d[1] = nums[0]
     d[i]是关于i单调递增，因为如果d[j]>=d[i]且j<i,应该考虑从长度为i的最长上升子序列的末尾删除i-j个元素， 那么这个序列长度表位j，且第j个元素x必然小于d[i]
     也就小于d[j],那么就找到一个长度为j的最长上升子序列，并且末尾元素比d[j]小，从而产生了矛盾，因此数组d的单调性得正
     
     依次遍历数组nums中的每个元素，并更新数组d和len的值。如果nums[i] > d[len] 则更新 len = len + 1,否则在d[1...len]中满足d[i-1]<nums[j]<d[i]
     的下标i，优化时间复杂度
     
     
     */
    // 二分搜索+贪心
    func lengthOfLIS_binary_tanxin(_ nums: [Int]) -> Int {
        var len = 1, n = nums.count
        if n == 0 { return 0 }
        var d = [Int](repeating: 0, count: n + 1)
        d[len] = nums[0]
        for i in 0..<n {
            if nums[i] > d[len] {
                len += 1
                d[len] = nums[i]
            } else {
                var l = 1, r = len, pos = 0
                while l <= r {
                    let mid = (l + r) / 2
                    if d[mid] < nums[i] {
                        pos = mid
                        l = mid + 1
                    } else {
                        r = mid - 1
                    }
                }
                d[pos + 1] = nums[i]
            }
        }
        return len
    }
}
