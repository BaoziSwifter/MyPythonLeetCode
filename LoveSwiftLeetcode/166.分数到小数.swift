/*
 * @lc app=leetcode.cn id=166 lang=swift
 *
 * [166] 分数到小数
 */

// @lc code=start
class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {

        var numerator = numerator
        var denominator = denominator
        var result = [String]()
        
        if numerator == 0 {
            return "0"
        }
        
        if (numerator > 0 && denominator < 0) || (numerator < 0 && denominator > 0) {
            result.append("-")
        }
        
        numerator = abs(numerator)
        denominator = abs(denominator)
        
        result.append(String(numerator / denominator))
        numerator %= denominator
        if numerator == 0 {
            return result.joined()
        }
        
        result.append(".")
        var map = [Int: Int]()
        map[numerator] = result.count
        while numerator != 0 {
            numerator *= 10
            result.append(String(numerator / denominator))
            numerator %= denominator
            if let index = map[numerator] {
                result.insert("(", at: index)
                result.append(")")
                break
            } else {
                map[numerator] = result.count
            }
        }
        
        return result.joined()
    }
}
// @lc code=end

