/*
 * @lc app=leetcode.cn id=557 lang=swift
 *
 * [557] 反转字符串中的单词 III
 */

// @lc code=start
class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ").map {
            String($0.reversed())
        }.joined(separator: " ")
    }

    func reverseWords_twopoints(_ s: String) -> String {
        let count = s.count
        var start = 0
        var res = Array<Character>(s)
        for i in 0..<count {
            if res[i] == " " || i == count - 1 {
                var slow = start
                var fast = i == count - 1 ? i : i - 1
                while slow < fast {
                    (res[slow], res[fast]) = (res[fast], res[slow])
                    slow += 1
                    fast -= 1
                }
                if res[i] == " " {
                    start = i + 1
                }
            }
        }
        return String(res)

    }
}
// @lc code=end

