//
//  258.-各位相加.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution258 {
    func addDigits(_ num: Int) -> Int {
        var num = num
        while num >= 10 {
            var tmpSum = 0
            while num > 0 {
                tmpSum += (num % 10)
                num /= 10
            }
            num = tmpSum
        }
        return num
    }
}
