//
//  45.-跳跃游戏-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution45 {
    // labuladong
    // 自顶向下+ 备忘录消除重叠子问题
    func jump_dp(_ nums: [Int]) -> Int {
        // 定义dp(_ p: Int) -> Int方法，是从索引p跳转到最后一步需要的最少步数
        // base case: 当p超过最后一个不需要跳跃
        /**
         if p >= nums.count - 1 { return 0 }
         */
        let n = nums.count
        var mem = [Int](repeating: n, count: n)
        func dp(_ mem: inout [Int], _ p: Int) -> Int {
            if p >= n - 1 { return 0 }
            if mem[p] != n {
                return mem[p]
            }
            let steps = nums[p]
            for i in 1...steps {
                let subRes = dp(&mem, p + i)
                mem[p] = min(mem[p], subRes + 1)
            }
            return mem[p]
        }
        return dp(&mem, 0)
    }
    
    func jump_tanxin(_ nums: [Int]) -> Int {
        let n = nums.count
        var end = 0, farthest = 0
        var jumps = 0
        for i in 0..<n-1 {
            farthest = max(nums[i] + i, farthest)
            if end == i {
                jumps += 1
                end = farthest
            }
        }
        return jumps
    }
}
