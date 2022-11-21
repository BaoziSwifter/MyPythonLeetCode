//
//  821.-字符的最短距离.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution821 {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let chars = Array(s)
        var res = [Int](repeating: chars.count, count: chars.count)
        var j = -1
        for i in 0 ..< chars.count {
            if chars[i] == c {
                j = i
            }
            if j == -1 { continue }
            res[i] = min(res[i], abs(i - j))
        }
        
        j = -1
        for i in (0..<chars.count).reversed() {
            if chars[i] == c {
                j = i
            }
            if j == -1 { continue }
            res[i] = min(res[i], abs(i - j))
        }
        return res
    }
    

}
