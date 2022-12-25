//
//  312.-戳气球.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution312 {
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        let nums = [1] + nums + [1]
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: n + 2)
        // 戳破0...n+1之间的所有的气球
        // 定义dp[i][j] = x 表示，戳破气球i和气球j之间（不含i和j）的所有的气球，可以获得的最高分数为x
        // base case 就是 dp[i][j] = 0,其中 0 <= i <= n + 1 , j <= i + 1,因为这种情况下， 开区间(i, j)中间没有气球可以戳
        // 推导状态转移方程
        // 确定气球i和气球j之间最后一个被戳破的气球可能是哪一个？，假设最后被戳破的为k,
        // 那得先把开区间(i, k)和(k,j)之间的气球都戳破；最后剩下的气球k，相邻的就是气球i和气球j，这时候戳破k的话得到的分数就是nums[i]*nums[k]*nums[j],
        // 则dp[i][j]的值应该为
        // dp[i][j] = dp[i][k] + dp[k][j] + nums[i]*nums[k]*nums[j]
        // 对于给定的一组i和j只需要穷举i < k < j的所有的气球k，选择得分最高的作为dp[i][j]的值即可
        // for k in (i+1)..<j {
        //     dp[i][j] = max(
        //         dp[i][j],
        //         dp[i][k] + dp[k][j] + nums[i]*nums[k]*nums[j]
        //     )
        // }
        
        /**
        穷举出来
        for (int i = ...; ;)
            for (int j = ...; ; )
                for (int k = i + 1; k < j; k ++)
                    dp[i][j] = max(dp[i][j], dp[i][k] + dp[k][j] + nums[i]*nums[j]*nums[k])
        return dp[0][n+1]
        */
        /**
        base case  在dp中dp[i][i] = 0
        // 从下往上遍历
         */
        // 开始状态转移
        // i 应该从下往上
        for i in (0...n).reversed() {
            for j in (i+1)..<(n+2) {
                for k in (i+1)..<j {
                    dp[i][j] = max(dp[i][j], dp[i][k] + dp[k][j] + nums[i]*nums[j]*nums[k])
                }
            }
        }
        return dp[0][n+1]
    }
}
