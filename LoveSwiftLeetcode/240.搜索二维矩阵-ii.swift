/*
 * @lc app=leetcode.cn id=240 lang=swift
 *
 * [240] 搜索二维矩阵 II
 */

// @lc code=start
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = matrix.count - 1
        var col = 0
        while row >= 0 && col < matrix[0].count {
            if matrix[row][col] > target {
                row -= 1
            } else if matrix[row][col] < target {
                col += 1
            } else {
                return true
            }
         }
         return false
    }
}
// @lc code=end

