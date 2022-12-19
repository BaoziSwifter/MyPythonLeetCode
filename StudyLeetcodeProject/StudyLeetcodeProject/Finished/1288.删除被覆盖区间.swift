//
//  1288.-删除被覆盖区间.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution1288 {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let intVS = intervals.sorted { a, b in
            if a[0] == b[0] { return a[1] > b[1] }
            return a[0] < b[0]
        }
        print(intVS)
        var res = 0
        var left = intVS[0][0], right = intVS[0][1]
        for i in 1 ..< intVS.count {
            let intv = intVS[i]
            if left <= intv[0] && intv[1] <= right  {
                res += 1
            }
            if intv[0] <= right && right <= intv[1] {
                right = intv[1]
            }
            
            if right < intv[0] {
                left = intv[0]
                right = intv[1]
            }
        }
        return intervals.count - res
    }
}
