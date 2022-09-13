//
//  62.-不同路径.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution62 {
    // 动态规划
    func uniquePaths_dp_2(_ m: Int, _ n: Int) -> Int {
       // 使用二维数组 dp[row][col] = dp[row-1][col] + dp[row][col-1]
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        for col in 0..<m {
            dp[0][col] = 1
        }
        for row in 0..<n {
            dp[row][0] = 1
        }
        for r in 1..<n {
            for c in 1..<m {
                dp[r][c] = dp[r-1][c] + dp[r][c-1]
            }
        }
        return dp[n-1][m-1]
    }
    
    // 一维动态规划
    func uniquePaths_dp_1(_ m: Int, _ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: m)
        for _ in 1..<n {
            for c in 1..<m {
                dp[c] = dp[c] + dp[c - 1]
            }
        }
        return dp[m-1]
    }
    
    // 从右下角到左上角查找
    func uniquePaths_dp_top(_ m: Int, _ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n)
        var r = n - 1
        while r > 0 {
            for i in (0..<m-1).reversed() {
                dp[i] = dp[i + 1] + dp[i]
            }
            r -= 1
        }
        return dp[0]
    }
    
    // 组合数学
    func uniquePaths_math(_ m: Int, _ n: Int) -> Int {
        // 从左上角到右下角的过程中，我们需要移动 m+n-2 次，其中有 m-1 次向下移动，n-1 次向右移动。因此路径的总数，就等于从 m+n-2 次移动中选择 m-1 次向下移动的方案数，即组合数：
        // (m + n - 2)!/[(m-1)!*(n-1)!]  ==> ((m+n-2)*(m+n-3)...n/(m-1)!)
        var res = 1
        var x = n, y = 1
        while y < m {
            res = Int (res * x / y)
            x += 1
            y += 1
        }
        return res
    }
}
