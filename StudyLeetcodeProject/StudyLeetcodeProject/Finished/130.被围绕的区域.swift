//
//  130.-被围绕的区域.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution130 {
    class UF {
        public var count: Int
        private var parent: [Int]
        private var size: [Int]
        public init(_ cnt: Int) {
            count = cnt
            parent = [Int](repeating: -1, count: cnt)
            size = [Int](repeating: -1, count: cnt)
            for i in 0..<cnt {
                parent[i] = i
                size[i] = 1
            }
        }
        public func unioin(_ p: Int, _ q: Int) {
            let rootP = find(p)
            let rootQ = find(q)
            if rootP == rootQ { return }
            // 小树接到大树下面，较平衡
            if size[rootP] > size[rootQ] {
                parent[rootQ] = rootP
                size[rootP] += size[rootQ]
            } else {
                parent[rootP] = rootQ
                size[rootQ] += size[rootP]
            }
            count -= 1
        }
        public func connectd(_ p: Int, _ q: Int) -> Bool {
            let rootP = find(p)
            let rootQ = find(q)
            // 处于同一棵树上的节点， 相互联通
            return rootP == rootQ
        }
        private func find(_ x: Int) -> Int {
            var x = x
            while (parent[x] != x) {
                // 进行路径压缩
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
    }
    
    func solve_uf(_ board: inout [[Character]]) {
        if board.count == 0 { return }
        let m = board.count
        let n = board[0].count
        let uf = UF(m * n + 1)
        let dumy = m * n
        // 将首列和末列的o 与dumy 连通
        for i in 0 ..< m {
            if board[i][0] == "O" {
                uf.unioin(i*n, dumy)
            }
            if board[i][n-1] == "O" {
                uf.unioin(i*n + n - 1, dumy)
            }
        }
        
        // 将首行和末行的O 与 dumy连通
        for j in 0 ..< n {
            if board[0][j] == "O" {
                uf.unioin(j, dumy)
            }
            if board[m-1][j] == "O" {
                uf.unioin(n * (m - 1) + j, dumy)
            }
        }
        // 方向数组d 是 上下左右搜索算法的常用手法
        let d = [[1, 0], [0, 1], [0, -1], [-1, 0]]
        for i in 1 ..< m - 1 {
            for j in 1 ..< n - 1 {
                if board[i][j] == "O" {
                    for k in 0 ..< 4 {
                        let x = i + d[k][0]
                        let y = j + d[k][1]
                        if board[x][y] == "O" {
                            uf.unioin(x * n + y, i * n + j)
                        }
                    }
                }
            }
        }
        
        // 所有不和dumy连通的 O 都要被替换
        for i in 1 ..< m - 1 {
            for j in 1 ..< n - 1 {
                if !uf.connectd(dumy, i * n + j) {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    // 深度优先遍历 时间复杂度O(row*col) 空间复杂度 O(row*col) 深度优先的栈的开销
    func solve_deep_first(_ board: inout [[Character]]) {
        // 对于 边界上的O 以它为起点，标记所有与它直接相连或者间接相连的字母O
        // 最后遍历矩阵，对于每一个字母
        //  如果该字母被标记过， 则该字母没有被X包围的字母O， 我们将其还原为字母O
        //  如果该字母没有被标记过， 则该字母为被X包围的字母O， 我们将其修改为字母X
        let row = board.count
        if row == 0 { return }
        let col = board[0].count
        
        func dfs(_ x: Int, _ y: Int) {
            if x < 0 || x >= row || y >= col || y < 0 || board[x][y] != "O" {
                return
            }
            board[x][y] = "A"
            dfs(x + 1, y)
            dfs(x - 1, y)
            dfs(x, y + 1)
            dfs(x, y - 1)
        }
        
        for i in 0 ..< row {
            dfs(i, 0)
            dfs(i, col - 1)
        }
        
        for j in 0 ..< col {
            dfs(0, j)
            dfs(row - 1, j)
        }
        for i in 0 ..< row {
            for j in 0 ..< col {
                if board[i][j] == "A" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func solve_broad(_ board: inout [[Character]]) {
        let row = board.count
        if row == 0 { return }
        let col = board[0].count
        var que = [[Int]]()
        for i in 0 ..< row {
            if board[i][0] == "O" {
                que.append([i, 0])
                board[i][0] = "A"
            }
            if board[i][col - 1] == "O" {
                que.append([i, col - 1])
                board[i][col - 1] = "A"
            }
        }
        for i in 0 ..< col {
            if board[0][i] == "O" {
                que.append([0, i])
                board[0][i] = "A"
            }
            if board[row - 1][i] == "O" {
                que.append([row - 1, i])
                board[row - 1][i] = "A"
            }
        }
        
        while que.count > 0 {
            let index = que.popLast()!
            let x = index[0], y = index[1]
            for item in [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]] {
                let xi = item[0], yi = item[1]
                if xi >= 0 && xi < row &&  yi >= 0 && yi < col && board[xi][yi] == "O" {
                    que.append([xi, yi])
                    board[xi][yi] = "A"
                }
            }
        }
        for i in 0 ..< row {
            for j in 0 ..< col {
                if board[i][j] == "A" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
        
    }
}


