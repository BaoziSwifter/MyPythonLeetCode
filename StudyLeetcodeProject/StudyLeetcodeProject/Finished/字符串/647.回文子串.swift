//
//  647.-回文子串.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution647 {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var count = 0
        for i in 0..<s.count {
            // 奇数回文
            var left = i
            var right = i
            while left >= 0, right < s.count, s[left] == s[right] {
                left -= 1
                right += 1
                count += 1
            }
            
            // 偶数回文
            left = i
            right = i + 1
            while left >= 0, right < s.count, s[left] == s[right] {
                left -= 1
                right += 1
                count += 1
            }
        }
        return count
    }
    
    func countSubstrings_dp(_ s: String) -> Int {
        let sChar = Array(s)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: s.count), count: s.count)
        var count = 0
        for i in (0..<sChar.count).reversed() {
            for j in (i..<sChar.count) {
                if sChar[i] == sChar[j] {
                    if j - i <= 1 {
                        count += 1
                        dp[i][j] = 1
                    } else if dp[i+1][j-1] == 1 {
                        count += 1
                        dp[i][j] = 1
                    }
                }
            }
        }
        return count
    }
}
