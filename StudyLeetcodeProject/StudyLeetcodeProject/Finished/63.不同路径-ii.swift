//
//  63.-不同路径-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution63 {
    
    // 第一步 自顶向下+备忘录
    func uniquePathsWithObstacles_top2bottom_mem(_ obstacleGrid: [[Int]]) -> Int {
        let row = obstacleGrid.count
        let col = obstacleGrid[0].count
        let rowVals = [Int](repeating: 0, count: col)
        var memo = [[Int]](repeating: rowVals, count: row)
        func dp(_ i: Int, _ j: Int) -> Int {
            if i < 0 || i >= row || j < 0 || j >= col || obstacleGrid[i][j] == 1 {
                // 数组越界 或者遇到阻碍
                return 0
            }
            // 起点到起点的路径 只有一个
            if (i == 0 && j == 0) {
                return 1
            }
            // 已经计算过了 不需要重复计算
            if memo[i][j] > 0 {
                return memo[i][j]
            }
            
            // 状态转义方程：
            // 到达了(i, j) 的路径条数等于：
            // 到达（i-1,j）+ (i, j - 1)的路径总和
            let left = dp(i, j - 1)
            let top = dp(i - 1, j)
            memo[i][j] = left + top
            return left + top
        }
        
        return dp(row - 1, col - 1)
    }
    
    // 第二步， 自底向上的动态规划
    func uniquePathsWithObstacles_bottom2top(_ obstacleGrid: [[Int]]) -> Int {
        let row = obstacleGrid.count
        let col = obstacleGrid[0].count
        // 数组索引偏移一位，dp[0][..] dp[..][0] 代表 obstacleGrid 之外
        // 定义：到达 obstacleGrid[i][j] 的路径条数为 dp[i-1][j-1]
        let rowVals = [Int](repeating: 0, count: col + 1)
        var dp = [[Int]](repeating: rowVals, count: row + 1)
        // base case：如果没有障碍物，起点到起点的路径条数就是 1
        dp[1][1] = obstacleGrid[0][0] == 1 ? 0 : 1;
        for i in 1 ... row {
            for j in 1 ... col {
                if i == 1 && j == 1 { continue }
                if obstacleGrid[i-1][j-1] == 1 { continue }
                dp[i][j]=dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[row][col]
    }
    // 第三步 优化二维 dp 数组为一维 dp
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let row = obstacleGrid.count
        let col = obstacleGrid[0].count
        var dp = [Int](repeating: 0, count: col + 1)
        dp[1] = obstacleGrid[0][0] == 1 ? 0 : 1
        for i in 1...row {
            for j in 1...col {
                if i == 1 && j == 1 { continue }
                if obstacleGrid[i - 1][j - 1] == 1 {
                    dp[j] = 0
                    continue
                }
                dp[j] = dp[j] + dp[j - 1]
                
            }
        }
        return dp[col]
    }
    
}
