//
//  50.-pow-x-n.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution50 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        let half = myPow(x, n / 2)
        return half * half * ( n % 2 == 1 ? x : 1)
    }
}
