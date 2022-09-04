//
//  509.斐波那契数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation


class Solution509 {
    func fib(_ n: Int) -> Int {

        var l = 0, r = 1
        for _ in 0..<n {
            (l, r) = (r, r + l)
        }
        return l
    }
}
