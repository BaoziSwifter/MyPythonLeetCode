//
//  204.-计数质数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution204 {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 { return 0 }
        var prims = [Bool](repeating: true, count: n)
        var count = 0
        prims[0] = false
        prims[1] = false
        
        for i in 2 ..< n {
            if prims[i] == false {
                continue
            }
            count += 1
            var index = i * i
            while index < n {
                prims[index] = false
                index += i
            }
        }
        return count
    }
}
