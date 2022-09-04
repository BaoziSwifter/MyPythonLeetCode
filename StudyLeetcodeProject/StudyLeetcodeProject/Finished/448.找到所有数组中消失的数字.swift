//
//  448.-找到所有数组中消失的数字.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution448 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return [] }
        var records = [Int](repeating: -1, count: nums.count)
        for n in nums {
            records[n-1] += 1
        }
        var res = [Int]()
        var index = 0
        for n in records {
            if n == -1 {
                res.append(index + 1)
            }
            index += 1
        }
        return res
    }
    // hash 法
    func findDisappearedNumbers_hash(_ nums: [Int]) -> [Int] {
        let st = Set(nums)
        var ans = [Int]()
        for v in 1...nums.count {
            if !st.contains(v) {
                ans.append(v)
            }
        }
        return ans
    }
}



