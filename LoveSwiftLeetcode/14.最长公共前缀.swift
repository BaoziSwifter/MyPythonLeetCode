/*
 * @lc app=leetcode.cn id=14 lang=swift
 *
 * [14] 最长公共前缀
 */

// @lc code=start
class Solution {
    func longestCommonPrefix_1(_ strs: [String]) -> String {
        guard strs.count != 0 else {
            return ""
        }
        guard strs.count != 1 else {
            return strs.first!
        }
        
        var strs = strs.sorted { $0.count < $1.count }
        
        var i = strs.first!.count
        while i > 0 {
            for j in 0..<strs.count {
                strs[j] = String(strs[j].prefix(i))
            }
            if Set(strs).count == 1 {
                return strs[0]
            } else {
                i -= 1
            }
        }
        return ""
    }
    func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.count == 0 {
            return ""
        }
        var minLen = Int.max
        for s in strs {
            minLen = min(minLen, s.count)
        }
        var low = 0, high = minLen
        while low < high {
            let mid = (high - low + 1) / 2 + low
            if isCommonPrefix(strs, mid) {
                low = mid
            } else {
                high = mid - 1
            }
        }
        return String(strs[0].prefix(low))
    }
    func isCommonPrefix(_ strs: [String], _ len: Int) -> Bool {
        let str0 = String(strs[0].prefix(len))
        let cnt = strs.count
        for i in 1..<cnt {
            let str = strs[i]
            for j in 0..<len {
                if Array(str0)[j] != Array(str)[j] {
                    return false
                }
            }
        }
        return true
    }
}
// @lc code=end

