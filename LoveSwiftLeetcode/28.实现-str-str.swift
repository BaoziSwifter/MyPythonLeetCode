/*
 * @lc app=leetcode.cn id=28 lang=swift
 *
 * [28] 实现 strStr()
 */

// @lc code=start
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count < needle.count { return -1 }
        if haystack.count > 0 && needle.count == 0 { return 0 }
        let needleCnt = needle.count
        let lastIndex = haystack.count - needleCnt
        var start = 0
        while start <= lastIndex {
            let subRange = haystack.index(haystack.startIndex, offsetBy: start)..<haystack.endIndex
            if haystack[subRange].hasPrefix(needle) {
                return start
            }
            start += 1
        }
        return -1
    }
}
// @lc code=end

