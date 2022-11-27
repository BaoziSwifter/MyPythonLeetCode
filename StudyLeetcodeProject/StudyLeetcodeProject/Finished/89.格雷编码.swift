//
//  89.-格雷编码.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution89 {
    func grayCode(_ n: Int) -> [Int] {
        var res = [Int](repeating: 0, count: 1 << n)
        for i in 0..<res.count {
            res[i] = ( i >> 1) ^ i
        }
        return res
    }
}
