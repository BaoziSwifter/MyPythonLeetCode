/*
 * @lc app=leetcode.cn id=48 lang=swift
 *
 * [48] 旋转图像
 */

// @lc code=start
class Solution {
    func rotate(_ a: inout [[Int]]) {
        // let n = a.count
        // for i in 0..<n {
        //     for j in i..<n {
        //         (a[i][j], a[j][i]) = (a[j][i], a[i][j])
        //     }
        // }
        // for i in 0..<n {
        //     for j in 0..<n/2 {
        //         (a[i][j], a[i][n - j - 1]) = (a[i][n - j - 1], a[i][j])
        //     }
        // }

        let n = a.count
        for i in 0..<n/2 {
            for j in i..<n-i-1 {
                (a[i][j],a[j][n-i-1],a[n-i-1][n-j-1],a[n-j-1][i]) = (a[n-j-1][i], a[i][j],a[j][n-i-1],a[n-i-1][n-j-1])
            }
        }
    }
}
// @lc code=end

