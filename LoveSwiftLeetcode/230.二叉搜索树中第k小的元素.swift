/*
 * @lc app=leetcode.cn id=230 lang=swift
 *
 * [230] 二叉搜索树中第K小的元素
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
    var i = 0
    var finalVal: Int?
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func kth(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            kth(root.left)
            i += 1
            if i == k {
                finalVal = root.val
                return
            }
            kth(root.right)
        }
        kth(root)
        return finalVal ?? 0
    }
}
// @lc code=end

