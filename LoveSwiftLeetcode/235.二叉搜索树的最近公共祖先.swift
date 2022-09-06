/*
 * @lc app=leetcode.cn id=235 lang=swift
 *
 * [235] 二叉搜索树的最近公共祖先
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
// @lc code=end

