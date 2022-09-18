/*
 * @lc app=leetcode.cn id=139 lang=swift
 *
 * [139] 单词拆分
 */

// @lc code=start
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1 ..< dp.count {
            for w in wordDict {
                if w.count <= i && dp[i - w.count] {
                    let start = s.index(s.startIndex, offsetBy: i - w.count)
                    let end = s.index(s.startIndex, offsetBy: i)
                    let tmpStr = String(s[start ..< end])
                    if tmpStr == w {
                        dp[i] = true
                        break
                    }
                }
            }
        }
        return dp[s.count]
    }
}
// @lc code=end

