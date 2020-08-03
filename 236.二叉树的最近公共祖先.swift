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
        guard let cur = root else { return nil }
        guard let tmpP = p else { return q }
        guard let tmpQ = q else { return p }

        if cur === tmpP || cur === tmpQ {
            return cur
        }

        let left = lowestCommonAncestor(cur.left, p, q)
        let right = lowestCommonAncestor(cur.right, p, q)

        if left != nil && right != nil {
            return cur
        }

        if left != nil {
            return left
        }

        if right != nil {
            return right
        }
        return nil       
    }
}
// @lc code=end

