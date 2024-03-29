/*
 * @lc app=leetcode.cn id=236 lang=swift
 *
 * [236] 二叉树的最近公共祖先
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
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
// @lc code=end

