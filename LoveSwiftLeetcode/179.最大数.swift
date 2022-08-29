/*
 * @lc app=leetcode.cn id=179 lang=swift
 *
 * [179] 最大数
 */

// @lc code=start
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let res = nums.sorted { a, b in
            let l = String(a)
            let r = String(b)
            return l + r > r + l
        }
        if res.first == .zero { return "0" }
        return res.reduce("") {
            $0 + String($1)
        }
    }
}
// @lc code=end

