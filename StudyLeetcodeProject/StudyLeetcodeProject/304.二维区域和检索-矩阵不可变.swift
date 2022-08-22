//
//  304.二维区域和检索-矩阵不可变.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/20.
//

import Foundation

class NumMatrix304 {

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
