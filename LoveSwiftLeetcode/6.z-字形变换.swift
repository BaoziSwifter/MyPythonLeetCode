/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        // if numRows <= 1 || numRows >= s.count { return s }
        // var res: String = ""
        // let group = 2 * numRows - 2
        // let sArray = Array(s)
        // for i in 0..<numRows {
        //     var j = 0
        //     while j < sArray.count - i {
        //         res.append(sArray[j + i])
        //         if i > 0 , i < numRows - 1 , j + group - i < sArray.count {
        //             res.append(sArray[j + group - i])
        //         }
        //         j += group
        //     }
        // }
        // return String(res)

        let n = numRows
        if n <= 1 || n >= s.count { return s }
        var res = [String](repeating: "", count: n)
        let g = 2 * (n - 1)
        var gIndex = 0
        for (i, c) in s.enumerated() {
            res[gIndex].append(c)
            if i % g < n - 1 {
                gIndex += 1
            } else {
                gIndex -= 1
            }
        }
        return res.joined(separator: "")
    }
}
// @lc code=end

