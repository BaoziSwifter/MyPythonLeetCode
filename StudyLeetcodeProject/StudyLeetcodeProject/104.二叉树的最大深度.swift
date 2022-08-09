//
//  104.二叉树的最大深度.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation

class Solution104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let r = root else {
            return 0
        }
        return max(maxDepth(r.left), maxDepth(r.right)) + 1
    }
}
