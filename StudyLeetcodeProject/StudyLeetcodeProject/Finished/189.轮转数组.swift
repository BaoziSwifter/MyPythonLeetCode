//
//  189.-轮转数组.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution189 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        if count < 2 {
            return
        }
        let realK = k % count
        for _ in 0 ..< realK {
            let temp = nums.popLast()!
            nums.insert(temp, at: 0)
        }
    }
}
