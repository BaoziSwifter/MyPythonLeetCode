//
//  73.-矩阵置零.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution73 {
    func setZeroes(_ matrix: inout [[Int]]) {
        let row = matrix.count
        let col = matrix[0].count
        var col0 = false
        for i in 0..<row {
            if matrix[i][0] == 0 {
                col0 = true
            }
            for j in 1..<col {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        
        for i in stride(from: row - 1, through: 0, by: -1) {
            for j in 1 ..< col {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if col0 {
                matrix[i][0] = 0
            }
        }
    }
}
