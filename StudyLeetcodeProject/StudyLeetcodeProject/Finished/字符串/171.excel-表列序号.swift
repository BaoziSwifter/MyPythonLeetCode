//
//  171.-excel-表列序号.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution171 {
    func titleToNumber(_ columnTitle: String) -> Int {
        var res = 0
        for c in columnTitle {
            res *= 26
            res += (Int(c.asciiValue!) - 64)
        }
        return res
    }
}
