/*
 * @lc app=leetcode.cn id=204 lang=swift
 *
 * [204] 计数质数
 */

// @lc code=start
class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 { return 0 }
        var prims = [Bool](repeating: true, count: n)
        var count = 0
        prims[0] = false
        prims[1] = false
        
        for i in 0 ..< n {
            if prims[i] == false {
                continue
            }
            count += 1
            var index = i * i
            while index < n {
                prims[index] = false
                index += i
            }
        }
        return count
    }
}
// @lc code=end

