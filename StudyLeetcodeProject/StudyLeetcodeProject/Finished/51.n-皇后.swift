//
//  51.n-皇后.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/29.
//

import Foundation

class Solution51 {
    var res = [[String]]()
    func solveNQueens(_ n: Int) -> [[String]] {
        var board = [[String]](repeating: [String](repeating: ".", count: n), count: n)
        backtrack(&board, 0)
        return res
        
    }
    func backtrack(_ board: inout [[String]], _ row: Int) {
        let n = board.count
        if row == n {
            res.append(convertToString(board))
            return
        }
        for col in 0 ..< n {
            if isValid(board, row, col, n) {
                board[row][col] = "Q"
                backtrack(&board, row + 1)
                board[row][col] = "."
            }
        }
    }
    
    func isValid(_ board: [[String]], _ row: Int, _ col: Int, _ n: Int) -> Bool {
        for i in 0 ..< row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // 检查对角线左上角
        var colIndex = col - 1
        var rowIndex = row - 1
        while colIndex >= 0 && rowIndex >= 0 {
            if board[rowIndex][colIndex] == "Q" {
                return false
            }
            colIndex -= 1
            rowIndex -= 1
        }
        
        // 检测右上角
        colIndex = col + 1
        rowIndex = row - 1
        while colIndex < n && rowIndex >= 0 {
            if board[rowIndex][colIndex] == "Q" {
                return false
            }
            colIndex += 1
            rowIndex -= 1
        }
        return true
    }
    
    func convertToString(_ board: [[String]]) -> [String] {
        var res = [String]()
        for i in board {
            res.append(i.joined())
        }
        return res
    }
    
}
