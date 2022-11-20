//
//  118.杨辉三角.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation
class Solution118 {
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
