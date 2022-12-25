//
//  235.-二叉搜索树的最近公共祖先.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if p!.val < root!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        }
        if p!.val > root!.val && root!.val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        }
        return root
    }
    
    func lowestCommonAncestor_while(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var root = root
        while root != nil {
            if p!.val < root!.val , root!.val > q!.val {
                root = root!.left
            } else if p!.val > root!.val , root!.val < q!.val {
                root = root!.right
            } else {
                break
            }
        }
        return root
    }
}
