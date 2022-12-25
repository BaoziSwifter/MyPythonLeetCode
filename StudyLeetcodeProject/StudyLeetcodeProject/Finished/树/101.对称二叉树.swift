//
//  101.-对称二叉树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution101 {
    func leftToRightSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil , right != nil {
            return false
        } else if left != nil , right == nil {
            return false
        } else if left == nil , right == nil {
            return true
        }
        if left!.val != right!.val {
            return false
        }
        let rl = leftToRightSymmetric(left?.right, right?.left)
        if rl == false {
            return false
        }
        let lr = leftToRightSymmetric(left?.left, right?.right)
        if lr == false {
            return false
        }
        return true
    }
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        return leftToRightSymmetric(root?.left, root?.right)
    }
}
