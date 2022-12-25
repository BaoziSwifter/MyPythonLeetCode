//
//  621.-任务调度器.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution621 {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var taskMap = [Character: Int]()
        for i in tasks {
            taskMap[i, default: 0] += 1
        }
        let maxCount = taskMap.values.max()!
        var lastCount = 0
        // 计算最后一个桶放入的任务个数，任务个数相同时 最大的任务会放在最后一个桶里
        for item in taskMap.values {
            if item == maxCount {
                lastCount += 1
            }
        }
        // 重复的任务多，任务种类少，每个桶的冷却时间可以满足执行其他任务
        let resultOne = (maxCount - 1) * (n + 1) + lastCount
        // 重复的任务少，任务的种类多，每个桶的冷却时间不能满足执行其他任务
        // 由于不含待命的时间， 最短时间明显由总任务个数决定
        let resTwo = tasks.count
        return max(resultOne, resTwo)
    }
}
