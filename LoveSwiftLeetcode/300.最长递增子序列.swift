/*
 * @lc app=leetcode.cn id=300 lang=swift
 *
 * [300] 最长递增子序列
 */

// @lc code=start
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        // if nums.count == 0 { return 0 }
        // var dp = [Int](repeating: 0, count: nums.count)
        // dp[0] = 1
        // var res = 1
        // for i in 1..<nums.count {
        //     dp[i] = 1
        //     for j in 0..<i {
        //         if nums[i] > nums[j] {
        //             dp[i] = max(dp[i], dp[j] + 1)
        //         }
        //     }
        //     res = max(res, dp[i])
        // }
        // return res
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
// @lc code=end

