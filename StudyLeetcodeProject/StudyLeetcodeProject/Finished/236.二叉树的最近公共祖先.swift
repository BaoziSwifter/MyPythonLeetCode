//
//  236.-二叉树的最近公共祖先.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        if root == nil { return nil }
        if root?.val == p?.val || root?.val == q?.val {
            return root
        }
        let l = lowestCommonAncestor(root?.left, p, q)
        let r = lowestCommonAncestor(root?.right, p, q)
        if l != nil && r != nil {
            return root
        }
        if l == nil && r == nil {
            return nil
        }
        return l == nil ? r : l
    }
}
