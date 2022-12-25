//
//  136.-只出现一次的数字.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution136 {
    // 异或
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for n in nums {
            res = res^n
        }
        return res
        // return nums.reduce(0) { $0 ^ $1 }
    }
    
    // hash 法
    func singleNumber_Hash(_ nums: [Int]) -> Int {
        var hashSet = Set<Int>()
        for n in nums {
            if hashSet.contains(n) {
                hashSet.remove(n)
            } else {
                hashSet.insert(n)
            }
        }
        return hashSet.randomElement()!
    }
}
