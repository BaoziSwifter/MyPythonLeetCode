//
//  221.最大正方形.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation


class Solution221 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let width = matrix[0].count
        let height = matrix.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: width), count: height)
        var maxValue = 0
        for i in 0..<width {
            dp[0][i] = matrix[0][i] == "0" ? 0 : 1
            if maxValue == 0 {
                maxValue = dp[0][i] == 1 ?  1 : 0
            }
        }
        for j in 0..<height {
            dp[j][0] = matrix[j][0] == "0" ? 0 : 1
            if maxValue == 0 {
                maxValue = dp[j][0] == 1 ?  1 : 0
            }
        }
        for i in 1..<height {
            for j in 1..<width {
                if matrix[i][j] == "0" {
                    continue
                }
                dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                maxValue = max(maxValue, dp[i][j])
            }
        }
        return maxValue * maxValue
    }
}
