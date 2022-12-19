//
//  134.-加油站.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution134 {
    func canCompleteCircuit_timeout(_ gas: [Int], _ cost: [Int]) -> Int {
        var res = -1
        let cnt = gas.count
        for i in 0 ..< cnt {
            // 从 i 站 出发
            var curValue = gas[i]
            for j in 0 ..< cnt {
                let realJ = (i + j) % cnt
                let nextJ = (i + j + 1) % cnt
                curValue -= cost[realJ]
                if curValue < 0 { break }
                curValue += gas[nextJ]
            }
            if curValue >= 0 {
                res = i
                break
            }
        }
        return res
    }
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0
        var index = 0
        var tempSum = 0
        for i in 0 ..< gas.count {
            total += (gas[i] - cost[i])
            tempSum += (gas[i] - cost[i])
            if tempSum < 0 {
                tempSum = 0
                index = i + 1
            }
        }
        return total < 0 ? -1 : index
    }
}
