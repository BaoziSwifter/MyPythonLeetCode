//
//  4.寻找两个正序数组的中位数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalCnt = nums1.count + nums2.count
        var index1 = 0, index2 = 0
        var lastValue = 0
        var curValue = 0
        while index1 + index2 <= totalCnt / 2 {
            lastValue = curValue
            if index2 >= nums2.count || (index1 < nums1.count && nums1[index1] < nums2[index2]) {
                curValue = nums1[index1]
                index1 += 1
            } else {
                curValue = nums2[index2]
                index2 += 1
            }
        }
        if totalCnt % 2 == 0 {
            return Double(lastValue + curValue) / 2
        }
        return Double(curValue)
    }
}
