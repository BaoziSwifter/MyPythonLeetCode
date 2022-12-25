//
//  22.-括号生成.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution22 {
    // MARK: 回溯算法1
    func generateParenthesis(_ n: Int) -> [String] {
        func backtrack(_ left: Int, _ right: Int, _ track: inout [Character], _ res: inout [String]) {
            if right < left { return }
            if left < 0 || right < 0 { return }
            if left == 0 && right == 0 {
                res.append(String(track))
                return
            }
            // 尝试放左括号
            track.append("(")
            backtrack(left - 1, right, &track, &res)
            track.removeLast()
            
            // 尝试放右括号
            track.append(")")
            backtrack(left, right - 1, &track, &res)
            track.removeLast()
        }
        if n == 0 { return [] }
        var res = [String]()
        var track = [Character]()
        backtrack(n, n, &track, &res)
        return res
    }

    // MARK: 回溯暴力法
    func generateParenthesis_baoli_outtime(_ n: Int) -> [String] {
        var res = [String]()
        func checkStr(_ resStr: [Character]) -> Bool{
            var leftCnt = 0
            for i in resStr {
                if i == "(" { leftCnt += 1 }
                else { leftCnt -= 1 }
            }
            return leftCnt == 0
        }
        func backtrack(_ track: inout [Character]) {
            if track.count == 2 * n {
                if checkStr(track) {
                    res.append(String(track))
                    return
                }
                track.append("(")
                backtrack(&track)
                track.removeLast()
                
                track.append(")")
                backtrack(&track)
                track.removeLast()
            }
        }
        var track = [Character]()
        backtrack(&track)
        return res
    }
    
    // MARK: 回溯算法2
    // 只有在知道序列仍然有效时才可以添加"("、")"
    // 可以通过跟踪到目前为止放置左和右括号的数目来做到这一点
    // 如果还有一个位置， 可以开始放置一个左括号
    // 如果它不超过左括号的数量，可以放置一个有括号
    func generateParenthesis_check(_ n: Int) -> [String] {
        var res = [String]()
        func trackback(_ s: inout String, _ left: Int = 0, _ right: Int = 0) {
            if s.count == 2 * n { res.append(s) }
            else {
                if left < n {
                    s.append("(")
                    trackback(&s, left + 1, right)
                    s.removeLast()
                }
                if left > right {
                    s.append(")")
                    trackback(&s, left, right + 1)
                    s.removeLast()
                }
            }
        }
        var s = ""
        trackback(&s)
        return res
    }
    
}
