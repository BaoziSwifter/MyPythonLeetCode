/*
 * @lc app=leetcode.cn id=1109 lang=swift
 *
 * [1109] 航班预订统计
 */

// @lc code=start
class Solution {
    func buildDiff(_ bookItem: [Int], _ diff: inout [Int]) {
        let b = bookItem[0] - 1
        let e = bookItem[1] - 1
        let val = bookItem[2]
        if b >= 0 && b < diff.count {
            diff[b] += val
            if e + 1 < diff.count {
                diff[e + 1] -= val
            }
        }
    }
    func buildResult(_ diff: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: diff.count)
        res[0] = diff[0]
        for i in 1 ..< diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var diff = [Int](repeating: 0, count: n)
        for item in bookings {
            buildDiff(item, &diff)
        }
        return buildResult(diff)
    }
}
// @lc code=end

