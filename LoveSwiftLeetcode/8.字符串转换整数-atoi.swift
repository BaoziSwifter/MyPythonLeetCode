/*
 * @lc app=leetcode.cn id=8 lang=swift
 *
 * [8] 字符串转换整数 (atoi)
 */

// @lc code=start
class Solution {
    func myAtoi(_ s: String) -> Int {
        // 刷指针法 不知道为啥有 SIGILL
        // if s.count == 0 { return 0 }
        // let sArray = Array(s)
        // var left = -1 , right = -1, start = 0
        // for (i, c) in sArray.enumerated() {
        //     if start == 0 {
        //         if c == "+" || c == "-" || (c <= "9" && c >= "0") {
        //             start = 1
        //             left = i
        //             right = i
        //         } else if c == " " {
        //             continue
        //         } else {
        //             return 0
        //         }
        //     } else {
        //         if (c <= "9" && c >= "0") {
        //             right += 1
        //         } else {
        //             break
        //         }
        //     }
        // }
        // if start == 0 {
        //     return 0
        // }
        // let res = sArray[left...right]
        // if res.count == 1 && (res[0] == "+" || res[0] == "-") {
        //     return 0
        // }
        // guard let finalValue = Int32(String(res)) else {
        //     return res.first == "-" ? Int(Int32.min) : Int(Int32.max)
        // }
        // return Int(finalValue)

        var start = false
        var returnStr = ""
        for ch in s {
            if !start {
                if (ch.isNumber || ch == "-" || ch == "+"){
                    start = true
                    returnStr.append(ch)
                } else if ch == " "{
                    continue
                } else {
                    return 0
                }
            }else {
                if ch.isNumber {
                    returnStr.append(ch)
                } else {
                    break
                }
            }
        }
        if start == false || returnStr == "+" || returnStr == "-" {
            return 0
        }
        guard let finalInt = Int32(returnStr) else {
            return returnStr.first == "-" ? Int(Int32.min): Int(Int32.max)
        }
        return Int(finalInt)
    }
}
// @lc code=end

