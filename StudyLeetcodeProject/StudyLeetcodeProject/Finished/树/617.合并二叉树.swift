//
//  617.-合并二叉树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution617 {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil {
            return root2
        }
        if root2 == nil {
            return root1
        }
        let r = TreeNode(root1!.val + root2!.val)
        r.left = mergeTrees(root1?.left, root2?.left)
        r.right = mergeTrees(root1?.right, root2?.right)
        return r
    }
}
