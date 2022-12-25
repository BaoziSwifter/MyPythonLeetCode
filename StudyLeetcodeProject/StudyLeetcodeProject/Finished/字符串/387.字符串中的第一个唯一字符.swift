//
//  387.-字符串中的第一个唯一字符.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution387 {
    func firstUniqChar(_ s: String) -> Int {
        var countMap = [Character: Int]()
        var indexMap = [Character: Int]()
        var i = 0
        for ch in s {
            countMap[ch , default: 0] += 1
            indexMap[ch] = i
            i += 1
        }
        var index = Int.max
        for (k, v) in countMap {
            if v == 1 {
                index = min(index, indexMap[k]!)
            }
        }
        return index == Int.max ? -1 : index
        
    }
}
