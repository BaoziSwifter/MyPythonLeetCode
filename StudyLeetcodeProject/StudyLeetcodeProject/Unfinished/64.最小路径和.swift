//
//  64.-最小路径和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution64 {
    func minPathSum_dp_bottom_top(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var memo = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        func dp(_ grid: [[Int]], _ i: Int, _ j: Int) -> Int {
            if i == 0, j == 0 { return grid[0][0] }
            if i < 0 || j < 0 { return Int.max }
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            memo[i][j] = min(dp(grid, i - 1, j), dp(grid, i, j - 1)) + grid[i][j]
            return memo[i][j]
        }
        return dp(grid, m - 1, n - 1)
    }
    
    func minPathSum_dp_top_bottom(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        dp[0][0] = grid[0][0]
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        for j in 1..<n {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
            }
        }
        return dp[m - 1][n - 1]
    }
}
