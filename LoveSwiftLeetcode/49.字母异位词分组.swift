/*
 * @lc app=leetcode.cn id=49 lang=swift
 *
 * [49] 字母异位词分组
 */

// @lc code=start
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            let key = String(s.sorted())
            dict[key, default: []].append(s)
        }
        return Array(dict.values)
    }
}
// @lc code=end

