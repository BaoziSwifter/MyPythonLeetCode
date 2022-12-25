//
//  91.解码方法.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution91 {
    func numDecodings(_ s: String) -> Int {
        let count = s.count
            if count < 1 { return 0 }
            var dp = [Int](repeating: 0, count: count + 1)
            dp[1] = (s[s.startIndex] == "0" ? 0 : 1)
            
            for i in 2...count {
                let c1 = s[s.index(s.startIndex, offsetBy: i-1)]
                let c2 = s[s.index(s.startIndex, offsetBy: i-2)]
                if c1 >= "1" && c1 <= "9" {
                    // s[i] 本身可以作为一个字母
                    dp[i] += dp[i - 1]
                }
                if c2 == "1" || c2 == "2" && c1 <= "6" {
                    // s[i] 和 s[i - 1] 结合起来表示一个字母
                    dp[i] += dp[i - 2]
                }
            }
            return dp[count]
    }
}
