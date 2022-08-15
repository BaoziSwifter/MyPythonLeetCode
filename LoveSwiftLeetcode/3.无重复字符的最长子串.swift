/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // var dic = [Character: Int]()
        // var start = 0
        // var result = 0
        // for (index, char) in s.enumerated() {
        //     let previousIndex = dic[char] ?? -1
        //     if previousIndex >= start {
        //         start = previousIndex + 1
        //     }
        //     let currentLength = index - start + 1
        //     result = max(result, currentLength)
        //     dic[char] = index
        // }
        // return result
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
// @lc code=end

