//
//  3.无重复字符的最长子串.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution3 {
    // 两层遍历
    func ç(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        var maxStr = ""
        var curStr = ""
        for c in s {
            while curStr.contains(c) {
                curStr.remove(at: curStr.startIndex)
            }
            curStr.append(c)
            if curStr.count > maxStr.count {
                maxStr = curStr
            }
        }
        return maxStr.count
    }
    // 滑动窗口
    func lengthOfLongestSubstring_slide(_ s: String) -> Int {
        var dic = [Character: Int]()
        var start = 0
        var res = 0
        for (i, c) in s.enumerated() {
            let preIndex = dic[c] ?? -1
            if preIndex >= start {
                start = preIndex + 1
            }
            let cLength = i - start + 1
            res = max(res, cLength)
            dic[c] = i
        }
        return res
    }
    
    // 三指针滑动窗口
    func lengthOfLongestSubstring_slide3(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        let chatArray = Array(s)
        var start = 0, end = 0, cur = 0,maxLen = 0
        while end < chatArray.count {
            cur = start
            while cur < end {
                if chatArray[cur] == chatArray[end] {
                    start = cur + 1
                    break
                }
                cur += 1
            }
            maxLen = max(maxLen, end - start + 1)
            end += 1
        }
        return maxLen
    }
}
