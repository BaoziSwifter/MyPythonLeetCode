/*
 * @lc app=leetcode.cn id=59 lang=swift
 *
 * [59] 螺旋矩阵 II
 */

// @lc code=start
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {

        var res = [[Int]]()
        for _ in 0..<n {
            res.append([Int](repeating: 1, count: n))
        }

        let circleCount = n / 2 + n % 2
        var curVal = 1
        for c in 0..<circleCount {

            // left -> right [c,n-1-c)
            for left in c..<n-1-c {
                res[c][left] = curVal
                curVal += 1
            }
            // top -> bottom [c+1,n-1-c)
            for top in c..<n-1-c{
                res[top][n-1-c] = curVal
                curVal += 1
            }

            // right -> left [n-1-c,c)
            for right in c..<n-1-c{
                res[n-1-c][n-right-1] = curVal
                curVal += 1

            }

            // bottom -> top [n-1-c,c+1)
            for bottom in c..<n-1-c {
                res[n-1-bottom][c] = curVal
                curVal += 1
            }

        }
        if n % 2 == 1 {
            res[n/2][n/2] = n*n
        }

        return res
    }
}
// @lc code=end

