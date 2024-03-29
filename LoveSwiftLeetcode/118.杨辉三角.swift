/*
 * @lc app=leetcode.cn id=118 lang=swift
 *
 * [118] 杨辉三角
 */

// @lc code=start
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var res = [[1]]
        for i in 1..<numRows {
            let lastRowValues = res.last!
            var newRowValues = [Int]()
            for j in 0...i {
                if j == 0 || j == i {
                    newRowValues.append(1)
                    continue
                }
                newRowValues.append(lastRowValues[j-1] + lastRowValues[j])
            }
            res.append(newRowValues)
        }

        return res
    }
}
// @lc code=end

