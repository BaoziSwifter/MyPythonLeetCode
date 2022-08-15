import Foundation

// leetcode 200 岛屿的数量
class Soluton_200 {
    func numIsLands_1(_ grid: [[Character]]) -> Int {
        guard grid.count > 0  else {
            return 0
        }
        guard grid[0].count > 0 else {
            return 0
        }
        
        var matrix = grid, numsOfIslands = 0
        func changeElement(_ matrix: inout [[Character]], _ i:Int, _ j: Int) {
            guard i >= 0, i < matrix.count, j >= 0, j < matrix[0].count, matrix[i][j] == "1" else {
                return
            }
            matrix[i][j] = "0"
            changeElement(&matrix, i+1, j)
            changeElement(&matrix, i-1, j)
            changeElement(&matrix, i, j+1)
            changeElement(&matrix, i, j-1)
        }
        for i in 0..<matrix.count {
            for j in 0 ..< matrix[0].count {
                if matrix[i][j] == "1" {
                    numsOfIslands += 1
                    changeElement(&matrix, i, j)
                }
            }
        }
        return numsOfIslands
        
    }

    func numsIslands_2(_ grid: [[Character]]) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)

        func helper(_ grid: [[Character]], _ i: Int,_ j: Int, _ visited: inout [[Bool]]) {
            visited[i][j] = true
            if i > 0 && !visited[i-1][j] && grid[i-1][j] == "1" {
                helper(grid, i-1, j,&visited)
            }
            if i < grid.count - 1, !visited[i+1][j], grid[i+1][j] == "1"{
                helper(grid, i+1, j, &visited)
            }
            if j > 0 && !visited[i][j-1] && grid[i][j-1] == "1" {
                helper(grid, i, j-1, &visited)
            }
            if j < grid[0].count - 1 , !visited[i][j+1],grid[i][j+1] == "1" {
                helper(grid, i, j+1, &visited)
            }
        }
        var res = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if !visited[i][j] {
                    if grid[i][j] == "1" {
                        res += 1
                        helper(grid, i, j, &visited)
                    }
                    visited[i][j] = true
                }
            }
        }
        return res
    }
}
