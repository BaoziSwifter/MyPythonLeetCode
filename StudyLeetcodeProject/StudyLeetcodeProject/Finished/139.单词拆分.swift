//
//  139.-单词拆分.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution139 {
    // 回溯+缓存
    func wordBreak_traceback(_ s: String, _ wordDict: [String]) -> Bool {
        var visited = [Int: Bool]()
        func wordBreakDFS(_ start: Int) -> Bool {
            if start > s.count { return false }
            if start == s.count { return true }
            var res = [String]()
            for i in start..<s.count {
                let subStr = String(s[s.index(s.startIndex, offsetBy: start)...s.index(s.startIndex, offsetBy: i)])
                if wordDict.contains(subStr) {
                    res.append(subStr)
                }
            }
            for i in (0..<res.count).reversed() {
                if let flag = visited[start + res[i].count] {
                    if flag == true { return flag }
                } else {
                    let flag = wordBreakDFS(start + res[i].count)
                    visited[start + res[i].count] = flag
                    if flag == true { return flag }
                }
            }
            return false
        }
        return wordBreakDFS(0)
    }
    
    // 动态规划 遍历字符串
    func wordBreak_dp_s(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1...s.count {
            for j in 0..<i {
                let tmpStr = String(s[s.index(s.startIndex, offsetBy: j) ..< s.index(s.startIndex, offsetBy: i)])
                if dp[j], wordDict.contains(tmpStr) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
    // 动态规划 遍历字典
    func wordBreak_dp_wordD(_ s: String, _ wordDict: [String]) -> Bool {
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
