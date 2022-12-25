//
//  94.二叉树的中序遍历.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var r = root
        var stack = [TreeNode]()
        var res = [Int]()
        while r != nil || stack.isEmpty == false {
            if r != nil {
                stack.append(r!)
                r = r?.left
            } else {
                let n = stack.popLast()!
                res.append(n.val)
                r = n.right
            }
        }
        return res
    }
}
