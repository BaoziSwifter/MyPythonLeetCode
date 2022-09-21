//
//  191.-位-1-的个数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution191 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, res = 0
        while n > 0 {
            n &= (n - 1)
            res += 1
        }
        return res
    }
}

