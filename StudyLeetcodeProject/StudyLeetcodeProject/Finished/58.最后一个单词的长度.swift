//
//  58.-最后一个单词的长度.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution58 {
    func lengthOfLastWord(_ s: String) -> Int {
        var result = 0
        for w in s.reversed() {
            if w != " " {
                result += 1
            } else if result > 0 {
                break
            }
        }
        return result
    }
}
