/*
 * @lc app=leetcode.cn id=13 lang=swift
 *
 * [13] 罗马数字转整数
 */

// @lc code=start
class Solution {
    func romanToInt(_ s: String) -> Int {
        let valDict: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var sum = 0
        var hasI = false, hasX = false, hasC = false
        let allChars = Array(s)
        for c in allChars {
            
            if c == "I" {
                hasI = true
            } else if c == "X" {
                hasX = true
                if hasI {
                    sum -= 2
                    hasI = false
                }
            } else if c == "C" {
                hasC = true
                if hasX {
                    hasX = false
                    sum -= 20
                }
            } else if c == "V" {
                if hasI {
                    hasI = false
                    sum -= 2
                }
            } else if c == "L" {
                if hasX {
                    sum -= 20
                    hasX = false
                }
            } else if c == "D" {
                if hasC {
                    sum -= 200
                    hasC = false
                }
            } else {
                if hasC {
                    sum -= 200
                    hasC = false
                }
            }
            let cur = valDict[c]!
            sum += cur
        }
        return sum
    }
}
// @lc code=end

