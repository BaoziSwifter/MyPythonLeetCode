/*
 * @lc app=leetcode.cn id=85 lang=swift
 *
 * [85] 最大矩形
 */

// @lc code=start
class Solution {
    func maximalRectangle_baoli(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        if m == 0 { return 0 }
        let n = matrix[0].count
        if n == 0 { return 0 }
        var left = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            if matrix[i][0] == "1" {
                left[i][0] = 1
            }
        }
        for i in 0..<m {
            for j in 1..<n {
                if matrix[i][j] == "1" {
                    left[i][j] = left[i][j - 1] + 1
                }
            }
        }
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "0" {
                    continue
                }
                var width = left[i][j]
                var area = width
                for k in (0..<i).reversed() {
                    width = min(width, left[k][j])
                    area = max(area, (i - k + 1) * width)
                }
                res = max(res, area)
            }
        }
        return res
    }

        func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        if m == 0 { return 0 }
        let n = matrix[0].count
        if n == 0 { return 0 }
        var left = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            if matrix[i][0] == "1" {
                left[i][0] = 1
            }
        }
        for i in 0..<m {
            for j in 1..<n {
                if matrix[i][j] == "1" {
                    left[i][j] = left[i][j - 1] + 1
                }
            }
        }
        var res = 0
        for i in 0..<n {
            var up = [Int](repeating: 0, count: m)
            var down = [Int](repeating: 0, count: m)
            var stack = [Int]()
            for j in 0..<m {
                while !stack.isEmpty, left[stack.last!][i] >= left[j][i] {
                    let _ = stack.popLast()
                }
                up[j] = stack.isEmpty ? -1 : stack.last!
                stack.append(j)
            }
            stack = [Int]()
            for j in (0..<m).reversed() {
                while !stack.isEmpty, left[stack.last!][i] >= left[j][i] {
                    let _ = stack.removeLast()
                }
                down[j] = stack.isEmpty ? m : stack.last!
                stack.append(j)
            }
            
            for j in 0..<m {
                let h = down[j] - up[j] - 1
                let area = h * left[j][i]
                res = max(res, area)
            }
        }
        return res
    }
}
// @lc code=end

