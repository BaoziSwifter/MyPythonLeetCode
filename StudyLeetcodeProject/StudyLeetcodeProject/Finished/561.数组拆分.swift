//
//  561.-数组拆分.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution561 {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let numss = nums.sorted()
        var start = 0
        var res = 0
        while start < nums.count {
            res += numss[start]
            start += 2
        }
        return res
    }
}
