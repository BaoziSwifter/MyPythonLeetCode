//
//  240.-搜索二维矩阵-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution240 {
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
