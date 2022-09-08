//
//  56.-合并区间.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 { return intervals }
        let intvs = intervals.sorted{ (a, b) in
            if a[0] == b[0] {
                return a[1] < b[1]
            }
            return a[0] < b[0]
        }
        var res = [[Int]]()
        var left = intvs[0][0], right = intvs[0][1]
        for i in 1..<intvs.count {
            let rg = intvs[i]
            if left <= rg[0], rg[0] <= right {
                if rg[1] >= right {
                    right = rg[1]
                }
            } else {
                res.append([left, right])
                left = intvs[i][0]
                right = intvs[i][1]
            }
        }
        res.append([left, right])
        return res
    }
}
