/*
 * @lc app=leetcode.cn id=10 lang=swift
 *
 * [10] 正则表达式匹配
 */

// @lc code=start
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s)
        let pArr = Array(p)
        var dp = Array(repeating: Array(repeating: false, count: pArr.count + 1), count: sArr.count + 1)

        dp[0][0] = true
        for j in 1..<dp[0].count {
            if pArr[j-1] == "*" {
                dp[0][j] = dp[0][j-2]
            }

        }
        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
                if sArr[i-1] == pArr[j-1] || pArr[j-1] == "." {
                    dp[i][j] = dp[i-1][j-1]
                } else if pArr[j-1] == "*" {
                    dp[i][j] = dp[i][j-2]
                    if sArr[i-1] == pArr[j-2] || pArr[j-2] == "."{
                        dp[i][j] = dp[i][j] || dp[i-1][j]
                    }
                }
            }
        }
        return dp[sArr.count][pArr.count]
    }
}
// @lc code=end

