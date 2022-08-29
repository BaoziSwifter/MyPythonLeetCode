/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 */

// @lc code=start
class Solution {
    var res = [[Int]]()
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var track = [Int]()
        backtrack(1, n, k, &track)
        return res
    }
    
    func backtrack(_ start: Int, _ end: Int, _ k: Int, _ track: inout [Int]) {
        if k == track.count {
            res.append(track)
            return
        }
        if start > end {
            return
        }
        for i in start ... end {
            track.append(i)
            backtrack(i + 1, end, k, &track)
            track.removeLast()
        }
    }
}
// @lc code=end

