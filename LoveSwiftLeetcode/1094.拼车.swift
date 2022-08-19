/*
 * @lc app=leetcode.cn id=1094 lang=swift
 *
 * [1094] 拼车
 */

// @lc code=start
class Solution {
    func increase(_ passengers: [Int], _ diff: inout [Int]) {
        let cnt = passengers[0]
        let b = passengers[1]
        let e = passengers[2]
        if b < diff.count && b >= 0 {
            diff[b] += cnt
            if e < diff.count {
                diff[e] -= cnt
            }
        }
    }
    func result(_ diff: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: 1001)
        res[0] = diff[0]
        for i in 1..<1001 {
            res[i] = diff[i] + res[i - 1]
        }
        return res
    }
    
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var diff = [Int](repeating: 0, count: 1001)
        for item in trips {
            increase(item, &diff)
        }
        for i in result(diff) {
            if i > capacity {
                return false
            }
        }
        return true
    }
}
// @lc code=end

