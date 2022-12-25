//
//  437.-路径总和-iii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution437 {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        func deepSumCnt(_ root: TreeNode?, _ targetSum: Int) -> Int {
            if root == nil {
                return 0
            }
            let leftVal = targetSum - root!.val
            var totalCnt = 0
            if leftVal == 0 {
                totalCnt += 1
            }
            totalCnt += deepSumCnt(root?.left, leftVal)
            totalCnt += deepSumCnt(root?.right, leftVal)
            return totalCnt
        }
        guard let root = root else {
            return 0
        }
        return pathSum(root.left, targetSum) + pathSum(root.right, targetSum) + deepSumCnt(root, targetSum)
    }
}
