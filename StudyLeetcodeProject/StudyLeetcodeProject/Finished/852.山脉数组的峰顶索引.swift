//
//  852.-山脉数组的峰顶索引.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution852 {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var res = -1
        let count = arr.count
        for i in 1..<count-1 {
            if arr[i] > arr[i-1] && arr[i] > arr[i+1] {
                res = i
                break
            }
        }
        
        return res
    }
    
    func peakIndexInMountainArray_bin(_ arr: [Int]) -> Int {
        var res = -1
        let count = arr.count
        var left = 1, right = count - 2
        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] > arr[mid + 1] {
                res = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
}
