/*
 * @lc app=leetcode.cn id=54 lang=swift
 *
 * [54] 螺旋矩阵
 */

// @lc code=start
class Solution {
    func spiralOrder(_ a: [[Int]]) -> [Int] {
         var res = [Int]()
        let n = a.count
        let m = a[0].count
        var l = 0, r = m - 1
        var t = 0, b = n - 1
        while res.count < m * n {
            if t <= b {
                var j = l
                while j <= r {
                    res.append(a[t][j])
                    j += 1
                }
                t += 1
            }
            if l <= r {
                var j = t
                while j <= b {
                    res.append(a[j][r])
                    j += 1
                }
                r -= 1
            }
            if t <= b {
                var j = r
                while j >= l {
                    res.append(a[b][j])
                    j -= 1
                }
                b -= 1
            }
            if l <= r {
                var j = b
                while j >= t {
                    res.append(a[j][l])
                    j -= 1
                }
                l += 1
            }
        }
        return res
    }
}
// @lc code=end

