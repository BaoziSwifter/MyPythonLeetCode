//
//  461.-汉明距离.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution461 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var res = 0
        while z != 0 {
            res += z % 2
            z >>= 1
        }
        return res
    }
    
    func hammingDistance_zidai(_ x: Int, _ y: Int) -> Int {
        return (x^y).nonzeroBitCount
    }
}
