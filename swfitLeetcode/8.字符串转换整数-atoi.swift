/*
 * @lc app=leetcode.cn id=8 lang=swift
 *
 * [8] 字符串转换整数 (atoi)
 */

// @lc code=start
class MyAtoiSolution {
   func myAtoi(_ s: String) -> Int {
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

