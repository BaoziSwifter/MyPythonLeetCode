/*
 * @lc app=leetcode.cn id=1020 lang=swift
 *
 * [1020] 飞地的数量
 */

// @lc code=start
class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) {
            
            if i < 0 || j < 0 || i >= m || j >= n {
                return
            }
            if grid[i][j] == 0 { return }
            grid[i][j] = 0
            dfs(&grid, i + 1, j)
            dfs(&grid, i - 1, j)
            dfs(&grid, i, j - 1)
            dfs(&grid, i, j + 1)
        }
        var grid = grid
        
        for i in 0..<m {
            dfs(&grid, i, 0)
            dfs(&grid, i, n - 1)
        }
        
        for i in 0..<n {
            dfs(&grid, 0, i)
            dfs(&grid, m - 1, i)
        }
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    res += 1
                }
            }
        }
        return res
    }
}
// @lc code=end

