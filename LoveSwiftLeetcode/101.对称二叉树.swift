/*
 * @lc app=leetcode.cn id=101 lang=swift
 *
 * [101] 对称二叉树
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
// @lc code=end

