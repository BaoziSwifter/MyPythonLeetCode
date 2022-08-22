/*
 * @lc app=leetcode.cn id=438 lang=swift
 *
 * [438] 找到字符串中所有字母异位词
 */

// @lc code=start
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let source = Array(s)
        // 窗口字典
        var window = [Character: Int](), need = [Character: Int]()
        for c in p {
            need[c, default: 0] += 1
        }
        
        var left = 0, right = 0
        var matchCnt = 0
        var res = [Int]()
        while right < source.count {
            let a = source[right]
            right += 1
            if need[a] != nil {
                window[a, default: 0] += 1
                if window[a] == need[a] {
                    matchCnt += 1
                }
            }
            
            while right - left >= p.count {
                if matchCnt == need.count {
                    res.append(left)
                }
                let d = source[left]
                left += 1
                if let v = need[d], v > 0 {
                    if window[d] == need[d] {
                        matchCnt -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        return res
    }
}
// @lc code=end

