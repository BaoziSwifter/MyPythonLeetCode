//
//  231.-2-的幂.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var n = n
        while n > 0 && n % 2 == 0 {
            n = n / 2
            
        }
        return n == 1
    }
}
