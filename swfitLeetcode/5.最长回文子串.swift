/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class LongestPalindromeSolution {
    func longestPalindrome(_ s: String) -> String {
        let strArr = Array(s)
        let n = strArr.count
        let arr = [Bool](repeating: false, count:n)
        var dp = [[Bool]](repeating: arr, count:n)
        var maxLenth = 0
        var start = 0
        var end = 0
        for j in 0..<n {
            for i in 0...j {
                if i == j {
                    dp[i][j] = true
                    continue
                }
                if strArr[i] != strArr[j] {
                    dp[i][j] = false
                    continue
                }
                if  strArr[i] == strArr[j], (j - i < 2) || dp[i+1][j-1]  {
                    dp[i][j] = true
                    if j - i >= maxLenth {
                        start = i
                        end = j
                    }
                    maxLenth = dp[i][j] ? max(maxLenth,j - i + 1) : maxLenth
                }
            }
        }
        return String(strArr[start...end])
    }
}
// @lc code=end

