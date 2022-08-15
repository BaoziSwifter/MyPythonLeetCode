/*
 * @lc app=leetcode.cn id=415 lang=swift
 *
 * [415] 字符串相加
 */

// @lc code=start
class AddStringSolution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let array1 = Array(num1)
        let array2 = Array(num2)
        let num1Len = num1.count
        let num2Len = num2.count
        var lastVal = 0
        var i = 0,j = 0
        var res = ""
        while i < num1Len || j < num2Len || lastVal > 0 {
            var sumVal = lastVal
            if i < num1Len {
                sumVal += Int(String(array1[num1Len-1-i]))!
                i += 1
            }
            if j < num2Len {
                sumVal +=  Int(String(array2[num2Len-1-j]))!
                j += 1
            }
            lastVal = sumVal / 10
            res = "\(sumVal % 10)\(res)"
        }
        return res       
    }
}
// @lc code=end

