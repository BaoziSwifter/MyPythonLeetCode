/*
 * @lc app=leetcode.cn id=91 lang=swift
 *
 * [91] 解码方法
 */

// @lc code=start
class Solution {
    func numDecodings(_ s: String) -> Int {
        let arr = Array(s)
        if arr[0] == "0" {
            return 0
        }
        var prev = 1, cur = 1
        for i in 1 ..< arr.count {
            let temp = cur
            if arr[i] == "0" {
                if arr[i - 1] == "1" || arr[i - 1] == "2" {
                    cur = prev
                } else {
                    return 0
                }
            } else if arr[i - 1] == "1" || (arr[i - 1] == "2" && arr[i] <= "6" && arr[i] >= "1") {
                cur += prev
            }
            prev = temp
        }
        return cur
    }
}
// @lc code=end

