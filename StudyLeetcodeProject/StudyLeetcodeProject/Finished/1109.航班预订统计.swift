//
//  1109.航班预订统计.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/19.
//

import Foundation

class Solution1109 {
    func buildDiff(_ bookItem: [Int], _ diff: inout [Int]) {
        let b = bookItem[0]
        let e = bookItem[1]
        let val = bookItem[2]
        if b >= 0 && b < diff.count {
            diff[b] += val
            if e + 1 < diff.count {
                diff[e + 1] -= val
            }
        }
    }
    func buildResult(_ diff: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: diff.count)
        res[0] = diff[0]
        for i in 1 ..< diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var diff = [Int](repeating: 0, count: n)
        for item in bookings {
            buildDiff(item, &diff)
        }
        return buildResult(diff)
    }
}
