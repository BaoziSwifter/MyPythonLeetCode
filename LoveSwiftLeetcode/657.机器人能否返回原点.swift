/*
 * @lc app=leetcode.cn id=657 lang=swift
 *
 * [657] 机器人能否返回原点
 */

// @lc code=start
class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        let chs = Array(moves)
        var resH = 0, resV = 0
        let moveMaps:[Character : Int] = ["U": 1, "D": -1, "R": 1, "L": -1]
        for c in chs {
            if c == "U" || c == "D" {
                resV += moveMaps[c]!
            } else {
                resH += moveMaps[c]!
            }

        }
        return resV == 0 && resH == 0
    }
}
// @lc code=end

