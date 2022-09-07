/*
 * @lc app=leetcode.cn id=1254 lang=swift
 *
 * [1254] 统计封闭岛屿的数目
 */

// @lc code=start
class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) {
            let m = grid.count, n = grid[0].count
            if i < 0 || j < 0 || i >= m || j >= n { return }
            if grid[i][j] == 1 {
                return
            } 
            grid[i][j] = 1
            dfs(&grid, i + 1, j)
            dfs(&grid, i - 1, j)
            dfs(&grid, i, j - 1)
            dfs(&grid, i, j + 1)
        }
        var grid = grid
        let m = grid.count, n = grid[0].count
        for i in 0..<n {
            dfs(&grid, 0, i)
            dfs(&grid, m - 1, i)
        }
        for i in 0..<m {
            dfs(&grid,i, 0)
            dfs(&grid,i, n - 1)
        }
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    res += 1
                    dfs(&grid, i, j)
                }
            }
        }
        return res
    }
}
// @lc code=end

