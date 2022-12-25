//
//  200.-岛屿数量.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution200 {
    
    // 0 淹没法
    func numIslands_fill_0(_ grid: [[Character]]) -> Int {
        func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
            guard i >= 0, i < grid.count, j >= 0, j < grid[0].count , grid[i][j] == "1" else {
                return
            }
            grid[i][j] = "0"
            dfs(&grid, i + 1, j)
            dfs(&grid, i - 1, j)
            dfs(&grid, i, j - 1)
            dfs(&grid, i, j + 1)
        }
        var res = 0
        let m = grid.count, n = grid[0].count
        var grid = grid
        // 遍历
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    res += 1
                    dfs(&grid, i, j)
                }
            }
        }
        return res
    }
    
    func numIslands_RECORD(_ grid: [[Character]]) -> Int {
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
