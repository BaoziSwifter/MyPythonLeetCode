/*
 * @lc app=leetcode.cn id=114 lang=swift
 *
 * [114] 二叉树展开为链表
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        flatten(root.left)
        flatten(root.right)
        // 后序遍历处理
        let left = root.left
        let right = root.right
        root.left = nil
        root.right = left
        var r = root
        while r.right != nil {
            r = r.right!
        }
        r.right = right
    }
}
// @lc code=end

