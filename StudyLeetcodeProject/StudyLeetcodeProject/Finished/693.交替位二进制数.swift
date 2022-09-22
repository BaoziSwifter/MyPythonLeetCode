//
//  693.-交替位二进制数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution693 {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var lastVal: Int?
        var n = n
        while n > 0 {
            let tmp = n % 2
            n >>= 1
            if let l = lastVal {
                if l == tmp {
                    return false
                }
            }
            lastVal = tmp
        }
        return true
    }
}
