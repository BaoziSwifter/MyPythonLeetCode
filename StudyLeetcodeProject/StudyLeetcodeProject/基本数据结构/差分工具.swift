//
//  差分工具.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/19.
//

import Foundation


class Difference {
    var diff: [Int] = [Int]()
    func difference(_ nums: [Int]) {
        if nums.count == 0 {
            return
        }
        diff = [Int](repeating: 0, count: nums.count)
        diff[0] = nums[0]
        for i in 1..<nums.count {
            diff[i] = nums[i] - nums[i - 1]
        }
    }
    
    func increment(_ begin: Int, _ end: Int, _ val: Int) {
        if  begin >= 0 , begin < end, end < diff.count {
            diff[begin] = val
            if end + 1 < diff.count {
                diff[end + 1] -= val
            }
        }
    }
    
    func result() -> [Int] {
        var res = [Int](repeating: 0, count: diff.count)
        res[0] = diff[0]
        for i in 1..<diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
    
}
