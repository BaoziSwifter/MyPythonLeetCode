//
//  739.-每日温度.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution739 {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: temperatures.count)
        // 单调栈
        var stack = [Int]()
        for i in 0..<temperatures.count {
            while let index = stack.last, temperatures[i] > temperatures[index] {
                stack.removeLast()
                res[index] = i - index
            }
            stack.append(i)
        }
        return res
    }
}
