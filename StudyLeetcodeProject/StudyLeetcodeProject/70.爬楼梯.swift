//
//  70.爬楼梯.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution70 {
    func climbStairs(_ n: Int) -> Int {

        var pre = 0
        var next = 1
        for _ in 0...n {
            (pre, next) = (next, pre + next)
        }
        return pre
    }
}
