/*
 * @lc app=leetcode.cn id=200 lang=swift
 *
 * [200] 岛屿数量
 */

// @lc code=start
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        func dfs(_ grid: [[Character]], _ visited: inout [[Bool]], _ i: Int, _ j: Int) {
            visited[i][j] = true
            if j > 0 ,visited[i][j - 1] == false, grid[i][j - 1] == "1" {
                dfs(grid, &visited, i, j - 1)
            }
            if j < grid[0].count - 1, visited[i][j + 1] == false, grid[i][j + 1] == "1" {
                dfs(grid, &visited, i, j + 1)
            }
            if i > 0, visited[i - 1][j] == false, grid[i - 1][j] == "1" {
                dfs(grid, &visited, i - 1, j)
            }
            if i < grid.count - 1, visited[i + 1][j] == false, grid[i + 1][j] == "1" {
                dfs(grid, &visited, i + 1, j)
            }
        }
        var res = 0
        let row = [Bool](repeating: false, count: grid[0].count)
        var visited = [[Bool]](repeating: row, count: grid.count)
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if visited[i][j] == false {
                    if grid[i][j] == "1" {
                        res += 1
                        dfs(grid, &visited, i, j)
                    }
                    visited[i][j] = true
                }
            }
        }
        return res
    }
}
// @lc code=end

