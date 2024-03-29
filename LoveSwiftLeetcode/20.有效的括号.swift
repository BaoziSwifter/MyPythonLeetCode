/*
 * @lc app=leetcode.cn id=20 lang=swift
 *
 * [20] 有效的括号
 */

// @lc code=start
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let sChar = Array(s)
        let map: [Character: Character] = [
            "}": "{",
            ")": "(",
            "]": "["
        ]
        for i in sChar {
            if i == "{" || i == "(" || i == "[" {
                stack.append(i)
            } else {
                if stack.count == 0 {
                    return false
                }
                let last = stack.popLast()
                if last != map[i]! {
                    return false
                }
            }
        }
        return stack.count == 0
    }
}
// @lc code=end

