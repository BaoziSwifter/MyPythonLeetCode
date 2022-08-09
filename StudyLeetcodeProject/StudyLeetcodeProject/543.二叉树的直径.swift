//
//  543.二叉树的直径.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation


class Solution543 {
    var maxDia = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        maxDepth(root)
        return maxDia
    }
    @discardableResult
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDep = maxDepth(root?.left)
        let rightDep = maxDepth(root?.right)
        let myDia = leftDep + rightDep
        maxDia = max(maxDia, myDia)
        return 1 + max(leftDep, rightDep)
    }
}
