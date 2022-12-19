//
//  74.-搜索二维矩阵.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution74 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count
        let col = matrix[0].count
        func findIndex(_ start: Int, _ end: Int) -> Bool {
            if start > end {
                return false
            }
            let mid = start + (end - start) / 2
            let rowi = mid / col
            let coli = mid % col
            if matrix[rowi][coli] == target {
                return true
            } else if matrix[rowi][coli] < target {
                return findIndex(rowi * col + coli + 1, end)
            } else {
                return findIndex(start, rowi * col + coli - 1)
            }
        }
        
        return findIndex(0, row * col - 1)
    }
}
