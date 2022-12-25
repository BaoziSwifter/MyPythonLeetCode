//
//  69.-x-的平方根.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution69 {
    func mySqrt(_ x: Int) -> Int {
        if x <= 1 { return x }
        var res = x
        while res * res > x {
            res = (res + x/res)/2
        }
        return res
    }
}
