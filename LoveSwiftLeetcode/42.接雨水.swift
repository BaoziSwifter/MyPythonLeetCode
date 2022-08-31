/*
 * @lc app=leetcode.cn id=42 lang=swift
 *
 * [42] 接雨水
 */

// @lc code=start
class Solution {
    func trap(_ height: [Int]) -> Int {
        // if height.count <= 2 { return 0 }
        // var sum = 0
        // let cnt = height.count
        // var l_max = [Int](repeating: 0, count: cnt)
        // var r_max = [Int](repeating: 0, count: cnt)
        // l_max[0] = height[0]
        // r_max[cnt-1] = height[cnt-1]
        // // 从左向右找
        // for i in 1..<cnt {
        //     l_max[i] = max(height[i], l_max[i - 1])
        // }
        
        // for i in (0..<cnt-1).reversed() {
        //     r_max[i] = max(height[i], r_max[i + 1])
        // }
        
        // for i in 1..<cnt-1 {
        //     sum += (min(l_max[i], r_max[i]) - height[i])
        // }
        // return sum
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
// @lc code=end

