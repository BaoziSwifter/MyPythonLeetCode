//
//  415.-字符串相加.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution415 {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var res = ""
        var leftVal = 0
        let num1Cnt = num1.count, num2Cnt = num2.count
        var n1 = num1, n2 = num2
        if num1Cnt > num2Cnt {
            n2 = String([Character](repeating: "0", count: n1.count - n2.count)) + n2
        } else if num1Cnt < num2Cnt {
            n1 = String([Character](repeating: "0", count: n2.count - n1.count)) + n1
        }
        let s1 = Array(n1), s2 = Array(n2)
        for i in 0..<s1.count {
            let val = (s1[s1.count - 1 - i]).wholeNumberValue! + (s2[s1.count - 1 - i]).wholeNumberValue! + leftVal
            res = "\(val%10)\(res)"
            leftVal = val / 10
        }
        if leftVal > 0 {
            res = "1\(res)"
        }
        return res
    }
}
