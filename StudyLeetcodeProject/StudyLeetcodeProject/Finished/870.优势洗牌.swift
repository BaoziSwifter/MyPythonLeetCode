//
//  870.优势洗牌.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

class Solution870 {
    // 打的过就打，打不过就用最差的送人头
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let count = nums1.count
        // 位置和值
        var tmpNums2 = [(Int, Int)]()
        for (i, n) in nums2.enumerated() {
            tmpNums2.append((i, n))
        }
        tmpNums2.sort { n1, n2 in
            return n1.1 >= n2.1
        }
        
        let nums1 = nums1.sorted()
        var res = [Int](repeating: 0, count: count)
        var left = 0, right = count - 1, k = 0
        while k < count {
            let p = tmpNums2[k]
            let i = p.0, n = p.1
            if nums1[right] > n {
                res[i] = nums1[right]
                right -= 1
            } else {
                res[i] = nums1[left]
                left += 1
            }
            k += 1
        }
        return res
    }
}
