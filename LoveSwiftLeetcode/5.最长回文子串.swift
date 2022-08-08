/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution {
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
// @lc code=end

