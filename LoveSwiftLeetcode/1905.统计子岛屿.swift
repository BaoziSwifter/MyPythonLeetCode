/*
 * @lc app=leetcode.cn id=1905 lang=swift
 *
 * [1905] 统计子岛屿
 */

// @lc code=start
class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        let m = grid1.count, n = grid1[0].count
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) {
            if i < 0 || j < 0 || i >= m || j >= n { return }
            if grid[i][j] == 0 { return }
            grid[i][j] = 0
            dfs(&grid, i, j - 1)
            dfs(&grid, i, j + 1)
            dfs(&grid, i - 1, j)
            dfs(&grid, i + 1, j)
        }
        var grid2 = grid2
        for i in 0..<m {
            for j in 0..<n {
                // 这个岛肯定不是子岛，淹掉
                if grid1[i][j] == 0, grid2[i][j] == 1 {
                    dfs(&grid2, i, j)
                }
            }
        }
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid2[i][j] == 1 {
                    res += 1
                    dfs(&grid2, i, j)
                }
            }
        }
        return res
    }
}
// @lc code=end

