//
//  14.-最长公共前缀.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution14 {
    // MARK:
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count != 0 else {
            return ""
        }
        guard strs.count != 1 else {
            return strs.first!
        }
        
        var strs = strs.sorted { $0.count < $1.count }
        
        var i = strs.first!.count
        while i > 0 {
            for j in 0..<strs.count {
                strs[j] = String(strs[j].prefix(i))
            }
            if Set(strs).count == 1 {
                return strs[0]
            } else {
                i -= 1
            }
        }
        return ""
    }
    // MARK: 分支法
    func longestCommonPrefix_fenzhi(_ strs: [String]) -> String {
        guard strs.count != 0 else {
            return ""
        }
        guard strs.count != 1 else {
            return strs.first!
        }
        return longestCommonPrefix_Inner(strs, 0, strs.count - 1)
    }
    
    func longestCommonPrefix_Inner(_ strs: [String], _ start: Int, _ end: Int) -> String {
        if start == end {
            return strs[start]
        } else {
            let mid = (end - start) / 2 + start
            let left = longestCommonPrefix_Inner(strs, start, mid)
            let right = longestCommonPrefix_Inner(strs, mid + 1, end)
            return commonPrefix(left, right)
        }
    }
    
    func commonPrefix(_ left: String, _ right: String) -> String {
        let minLen = min(left.count, right.count)
        let leftArr = Array(left), rightArr = Array(right)
        for i in 0..<minLen {
            if leftArr[i] != rightArr[i] {
                return String(leftArr[0..<i])
            }
        }
        return String(leftArr[0..<minLen])
    }
    
    // MARK: 二分法
    func longestCommonPrefix_Two(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var minLen = Int.max
        for s in strs {
            minLen = min(minLen, s.count)
        }
        var low = 0, high = minLen
        while low < high {
            let mid = (high - low + 1) / 2 + low
            if isCommonPrefix(strs, mid) {
                low = mid
            } else {
                high = mid - 1
            }
        }
        return String(strs[0].prefix(low))
    }
    func isCommonPrefix(_ strs: [String], _ len: Int) -> Bool {
        let str0 = String(strs[0].prefix(len))
        let cnt = strs.count
        for i in 1..<cnt {
            let str = strs[i]
            for j in 0..<len {
                if Array(str0)[j] != Array(str)[j] {
                    return false
                }
            }
        }
        return true
    }
}
