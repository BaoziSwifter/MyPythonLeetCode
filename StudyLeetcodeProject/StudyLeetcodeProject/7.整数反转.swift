//
//  7.整数反转.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution7 {
    func reverse(_ x: Int) -> Int {
        var x = x
        var sum = 0
        while x != 0 {
            sum = sum * 10 + (x % 10)
            x = x / 10
        }
        if sum > 2147483647 || sum < -2147483647 {
            sum = 0
        }
        return sum
    }
}
