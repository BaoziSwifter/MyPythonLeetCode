//
//  79.-单词搜索.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count, n = board[0].count
        let wordChars = Array(word)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)

        func backtrace(_ i: Int, _ j: Int, _ s:Int) -> Bool {
            if s >= word.count {
                return true
            }
            if i < 0 || j < 0 || i >= m || j >= n { return false }
            if board[i][j] != wordChars[s] { return false }
            if visited[i][j] == true { return false }
            
            visited[i][j] = true
            if backtrace(i-1, j, s+1) ||
                backtrace(i+1, j, s+1) ||
                backtrace(i, j+1, s+1) ||
                backtrace(i, j-1, s+1) {
                return true
            }
            visited[i][j] = false
            return false
        }
        for i in 0..<m {
            for j in 0..<n {
                if backtrace(i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
}
