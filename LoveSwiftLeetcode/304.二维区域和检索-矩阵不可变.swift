/*
 * @lc app=leetcode.cn id=304 lang=swift
 *
 * [304] 二维区域和检索 - 矩阵不可变
 */
 
// @lc code=start

class NumMatrix {

    private var preSum:[[Int]]
    init(_ matrix: [[Int]]) {
        let row = matrix.count
        let column = matrix[0].count
        if row == 0 || column == 0 {
            preSum = [[Int]]()
        } else {
            preSum = [[Int]](repeating: [Int](repeating: 0, count: column+1), count: row + 1)
            for i in 1...row {
                for j in 1...column {
                    preSum[i][j] = preSum[i-1][j] + preSum[i][j-1] + matrix[i-1][j-1] - preSum[i-1][j-1]
                }
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return preSum[row2+1][col2+1] - preSum[row1][col2+1] - preSum[row2+1][col1] + preSum[row1][col1]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
// @lc code=end

