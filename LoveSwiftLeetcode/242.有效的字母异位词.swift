/*
 * @lc app=leetcode.cn id=242 lang=swift
 *
 * [242] 有效的字母异位词
 */

// @lc code=start
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var sMap = [Character: Int]()
        for i in s {
            sMap[i, default: 0] += 1
        }
        for i in t {
            sMap[i, default: 0] -= 1
        }
        return sMap.values.min() == 0 && sMap.values.max() == 0
    }
}
// @lc code=end

