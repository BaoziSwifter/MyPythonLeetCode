//
//  338.-比特位计数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution338 {
    func countBits(_ n: Int) -> [Int] {
        var res = [Int](repeating: 0, count: n + 1)
        var i = 1
        while i <= n {
            res[i] = res[i>>1] + i&1
            i += 1
        }
        return res
    }
}
