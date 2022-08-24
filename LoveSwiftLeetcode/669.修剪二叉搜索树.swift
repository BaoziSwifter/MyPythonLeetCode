/*
 * @lc app=leetcode.cn id=669 lang=swift
 *
 * [669] 修剪二叉搜索树
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
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let r = root else {
            return root
        }
        if r.val < low {
            return trimBST(r.right, low, high)
        }
        if r.val > high {
            return trimBST(r.left, low, high)
        }
        r.left = trimBST(r.left, low, high)
        r.right = trimBST(r.right, low, high)
        return root
    }
}
// @lc code=end

