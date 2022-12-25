//
//  172.-阶乘后的零.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution172 {
    func trailingZeroes(_ n: Int) -> Int {
        // 包含 2 和 5 的对数
        // 但是五的个数小于2  主要统计有多少个五就可以了
        var res = 0
        var n = n
        while n > 0 {
            n /= 5
            res += n
        }
        return res
    }
}
