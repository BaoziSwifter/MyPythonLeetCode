//
//  59.-螺旋矩阵-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var l = 0, r = n - 1
        var t = 0, b = n - 1
        var val = 1
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        while val <= n * n {
            var j = 0
            if t <= b {
                j = l
                while j <= r {
                    res[t][j] = val
                    val += 1
                    j += 1
                }
                t += 1
            }
            if l <= r {
                j = t
                while j <= b {
                    res[j][r] = val
                    val += 1
                    j += 1
                }
                r -= 1
            }
            if t <= b {
                j = r
                while j >= l {
                    res[b][j] = val
                    val += 1
                    j -= 1
                }
                b -= 1
            }
            if l <= r {
                j = b
                while j >= t {
                    res[j][l] = val
                    val += 1
                    j -= 1
                }
                l += 1
            }
        }
        return res
    }
}
