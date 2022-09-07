

class Solution {
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ res : inout String, _ dir: Int) {
            if i < 0 || j < 0 || i >= m || j >= n || grid[i][j] == 0 { return }
            // 前序遍历 进入 （i, j）
            grid[i][j] = 0
            res += "\(dir),"
            dfs(&grid, i, j - 1, &res, 1)
            dfs(&grid, i, j + 1, &res, 2)
            dfs(&grid, i - 1, j, &res, 3)
            dfs(&grid, i + 1, j, &res, 4)
            // 后续遍历： 离开（i, j）
            res += "\(-dir),"
        }
        // 记录所有岛屿的序列化结果
        var grid = grid
        var islands = Set<String>()
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    // 淹掉这个岛屿， 同时存储岛屿序列化的结果
                    var res = ""
                    dfs(&grid, i, j, &res, 7)
                    islands.insert(res)
                }
            }
        }
        return islands.count
    }
    }
}