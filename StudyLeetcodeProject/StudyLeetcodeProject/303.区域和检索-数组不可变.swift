//
//  303.区域和检索-数组不可变.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/20.
//

import Foundation

class NumArray303 {

    var nums: [Int]
     init(_ nums: [Int]) {
         self.nums = nums
     }
     
     func sumRange(_ left: Int, _ right: Int) -> Int {
         var res = 0
         for i in left...right {
             res += self.nums[i]
         }
         return res
     }
}

// 前缀和法
class NumArray303_2 {

    var preNums: [Int]
    init(_ nums: [Int]) {
        preNums = [Int](repeating: 0, count: nums.count + 1)
        for i in 1..<preNums.count {
            preNums[i] = preNums[i-1] + nums[i-1]
        }
    }
     
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preNums[right + 1] - preNums[left]
    }
}
