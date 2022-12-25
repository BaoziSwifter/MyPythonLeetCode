//
//  57.-插入区间.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution57 {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var insertInt = newInterval
        var hasInsert = false
        for r in intervals {
            if !hasInsert {
                if r[0] <= insertInt[0] && insertInt[0] <= r[1]{
                    insertInt[0] = r[0]
                }
                if r[0] <= insertInt[1] && insertInt[1] <= r[1] {
                    insertInt[1] = r[1]
                }
                if insertInt[1] < r[0] {
                    hasInsert = true
                    res.append(insertInt)
                    res.append(r)
                    continue
                }
                if insertInt[0] > r[1] {
                    res.append(r)
                }
            } else {
                res.append(r)
            }
        }
        if !hasInsert {
            res.append(insertInt)
        }
        return res
    }
}
