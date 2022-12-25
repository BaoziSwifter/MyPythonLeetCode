//
//  398.-随机数索引.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution398 {
    var numMap = [Int: (Int, Int)]()
    init(_ nums: [Int]) {
        var curVal: Int?
        var startIndex: Int?
        for (i, v) in nums.enumerated() {
            if let cV = curVal {
                if cV != v {
                    numMap[cV] = (startIndex!, i - 1)
                }
                curVal = v
                startIndex = i
            } else {
                curVal = v
                startIndex = i
            }
        }
        numMap[curVal!] = (startIndex!, nums.count - 1)
    }
    
    func pick(_ target: Int) -> Int {
        let (start, end) = numMap[target]!
        let cnt = end - start + 1
        let r = Int.random(in: 0 ..< cnt)
        return start + r
    }
}
