//
//  695.岛屿的最大面积.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/7.
//

import Foundation

class Solution695 {
    // 只不过 dfs 函数淹没岛屿的同时，还应该想办法记录这个岛屿的面积。
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var res = 0
        let m = grid.count, n = grid[0].count
        var grid = grid
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j:Int) -> Int {
            if i < 0 || j < 0 || i >= m || j >= n {
                // 超出索引边界
                return 0
            }
            // 已经是海水了
            if grid[i][j] == 0 {
                return 0
            }
            grid[i][j] = 0 // 变成海水
            return dfs(&grid, i + 1, j)
            + dfs(&grid, i - 1, j)
            + dfs(&grid, i, j + 1)
            + dfs(&grid, i, j - 1)
            + 1
        }
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    res = max(res, dfs(&grid, i, j))
                }
            }
        }
        return res
    }
}
