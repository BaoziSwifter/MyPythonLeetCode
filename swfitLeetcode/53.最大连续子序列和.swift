import Foundation
class Solution_53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count < 1 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maxVal = dp[0]

        for i in 1 ..< nums.count {
            if dp[i-1] < 0 {
                dp[i] = nums[i]
            }else {
                dp[i] = dp[i-1]+nums[i]
            }
            maxVal = max(maxVal, dp[i])
        }
        return maxVal
    }
}
