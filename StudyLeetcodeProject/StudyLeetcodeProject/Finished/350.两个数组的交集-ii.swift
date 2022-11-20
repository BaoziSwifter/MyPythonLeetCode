//
//  350.-两个数组的交集-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution350 {
    func intersect_hash(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let num1Count = nums1.count, nums2Count = nums2.count
        
        if num1Count == 0 || nums2Count == 0 {
            return []
        }
        var mapsNums = nums1
        var checkNums = nums2
        if num1Count > nums2Count {
            mapsNums = nums2
            checkNums = nums1
        }
        
        var countMaps = [Int: Int]()
        for i in mapsNums {
            countMaps[i, default: 0] += 1
        }
        var res = [Int]()
        for j in checkNums {
            if countMaps[j, default: 0] > 0 {
                countMaps[j, default: 0] -= 1
                res.append(j)
            }
        }
        return res
    }
    
    func intersect_two_pointers(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1Count = nums1.count, nums2Count = nums2.count
        
        if nums1Count == 0 || nums2Count == 0 {
            return []
        }
        
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()
        var first = 0
        var second = 0
        var res = [Int]()
        
        while first < nums1Count && second < nums2Count {
            if nums1[first] == nums2[second] {
                res.append(nums1[first])
                first += 1
                second += 1
            } else if nums1[first] > nums2[second] {
                second += 1
            } else {
                first += 1
            }
        }
        return res
    }
}
