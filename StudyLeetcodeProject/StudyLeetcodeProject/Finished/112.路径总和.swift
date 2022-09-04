//
//  112.路径总和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution112 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let r = root else {
            return false
        }
        if r.left == nil , r.right == nil {
            return targetSum == r.val
        }
        return hasPathSum(r.left, targetSum - r.val) || hasPathSum(r.right, targetSum - r.val)
    }
}
