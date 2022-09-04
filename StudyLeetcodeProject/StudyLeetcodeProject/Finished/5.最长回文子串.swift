//
//  5.最长回文子串.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/8.
//

import Foundation

/**
 [5] 最长回文子串
 给你一个字符串 s，找到 s 中最长的回文子串。
 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母组成
 */

class Solution5 {
    func longestPalindrome(_ s: String) -> String {
        var res = Array("")
        let sArr = Array(s)
        for i in 0..<s.count {
            let s1 = subStringPalindrome(sArr, i, i)
            let s2 = subStringPalindrome(sArr, i, i + 1)
            let rs = s1.count > s2.count ? s1 : s2
            res = res.count > rs.count ? res : rs
        }
        return String(res)
    }
    
    func subStringPalindrome(_ s: [Character], _ left: Int, _ right: Int) -> [Character] {
        var l = left
        var r = right
        while l >= 0, r < s.count, s[l] == s[r] {
            l -= 1
            r += 1
        }
        return Array(s[(l + 1)..<r])
    }
}
