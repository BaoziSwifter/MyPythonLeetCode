//
//  42.接雨水.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/31.
//

import Foundation


class Solution42 {
    func trap_baoli(_ height: [Int]) -> Int {
        if height.count <= 1 { return 0 }
        var sum = 0
        let cnt = height.count
        for i in 1 ..< cnt-1 {
            var l_max = 0, r_max = 0
            // 找右边的子搞得柱子
            for j in i..<cnt-1 {
                r_max = max(r_max, height[j])
            }
            
            for j in 0...i {
                l_max = max(l_max, height[j])
            }
            sum += (min(r_max, l_max) - height[i])
        }
        
        return sum
    }
    func trap_beiwanglu(_ height: [Int]) -> Int {
        if height.count <= 1 { return 0 }
        var sum = 0
        let cnt = height.count
        var l_max = [Int](repeating: 0, count: cnt)
        var r_max = [Int](repeating: 0, count: cnt)
        l_max[0] = height[0]
        r_max[cnt-1] = height[cnt-1]
        // 从左向右找
        for i in 1..<cnt {
            l_max[i] = max(height[i], l_max[i - 1])
        }
        
        for i in (0..<cnt-1).reversed() {
            r_max[i] = max(height[i], r_max[i + 1])
        }
        
        for i in 1..<cnt-1 {
            sum += (min(l_max[i], r_max[i]) - height[i])
        }
        return sum
    }
    
    func trap_twopoint(_ height: [Int]) -> Int {
        var sum = 0
        let cnt = height.count
        if cnt <= 2 { return sum }
        var left = 0
        var right = cnt - 1
        var l_max = 0, r_max = 0
        while left < right {
            l_max = max(l_max, height[left])
            r_max = max(r_max, height[right])
            
            if l_max < r_max {
                sum += l_max - height[left]
                left += 1
            } else {
                sum += r_max - height[right]
                right -= 1
            }
        }
        return sum
    }
}
