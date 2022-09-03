//
//  1541.平衡括号字符串的最少插入次数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/3.
//

import Foundation


class Solution1541 {
    func minInsertions(_ s: String) -> Int {
        var res = 0, need = 0
        for c in s {
            if c == "(" {
                need += 2
                if need % 2 == 1 {
                    res += 1
                    need -= 1
                }
            }
            if c == ")" {
                need -= 1
                if need == -1 {
                    res += 1
                    need = 1
                }
            }
        }
        return res + need
    }
}
