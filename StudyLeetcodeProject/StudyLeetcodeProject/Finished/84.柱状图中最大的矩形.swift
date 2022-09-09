//
//  84.-柱状图中最大的矩形.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution84 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [(Int, Int)]()
        var res = 0
        let heights = [0] + heights + [0]
        for item in heights.enumerated() {
            while !stack.isEmpty, let last = stack.last, item.1 < last.1 {
                let _ = stack.popLast()
                let leftVal = stack.last?.0 ?? 0
                res = max(res, (item.0 - leftVal - 1) * last.1)
            }
            stack.append(item)
        }
        return res
    }
}
