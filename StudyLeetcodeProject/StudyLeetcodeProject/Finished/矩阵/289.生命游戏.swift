//
//  289.-生命游戏.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution289 {
    func gameOfLife(_ board: inout [[Int]]) {
        /**
         目前是0（死）-> 将要是0（继续死）
         目前是0（死）-> 将要是2（复活）
         目前是1（活）-> 将要1（活的）
         目前是1（活）-> 将要3（死的）
         */
        let row = board.count
        if row <= 0 {
            return
        }
        let col = board[0].count
        var lastRow = [Int](repeating: 0, count: col)
        let map = [0: 0, 1 : 0, 2: 1, 3: 1]
        for r in 0 ..< row {
            let tempRowVal = board[r]
            for c in 0 ..< col {
                var totalVal = 0
                // 左
                if c > 0 {
                    totalVal += tempRowVal[c - 1]
                }
                // 右
                if c < col - 1 {
                    totalVal += tempRowVal[c + 1]
                }
                // 上
                if r > 0 {
                    totalVal += lastRow[c]
                }
                // 下
                if r < row - 1 {
                    totalVal += board[r + 1][c]
                }
                // 左上
                if r > 0 && c > 0 {
                    totalVal += lastRow[c - 1]
                }
                // 右上
                if r > 0  && c < col - 1 {
                    totalVal += lastRow[c + 1]
                }
                // 右下
                if r < row - 1 && c < col - 1 {
                    totalVal += board[r + 1][c + 1]
                }
                // 左下
                if r < row - 1 && c > 0 {
                    totalVal += board[r + 1][c - 1]
                }
                if board[r][c] == 0 {
                    if totalVal == 3 {
                        board[r][c] = 1
                    }
                } else {
                    if totalVal <= 3 {
                        board[r][c] = map[totalVal]!
                    } else {
                        board[r][c] = 0
                    }
                }
            }
            lastRow = tempRowVal
        }
    }
}
