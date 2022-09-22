//
//  476.-数字的补数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution476 {
    func findComplement(_ num: Int) -> Int {
        var i = 1
        while i <= num {
            i = i << 1
        }
        return i - 1 - num
    }
}
