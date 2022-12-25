//
//  867.-转置矩阵.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution867 {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let row = matrix.count
        if row == 0 { return [[Int]]() }
        let colum = matrix[0].count
        var ans = [[Int]]()
        for i in 0 ..< colum {
            var temp = [Int]()
            for j in 0 ..< row {
                temp.append(matrix[j][i])
            }
            ans.append(temp)
        }
        return ans
    }
}
