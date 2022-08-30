/*
 * @lc app=leetcode.cn id=100 lang=swift
 *
 * [100] 相同的树
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil , q != nil {
            return false
        }
        if p != nil , q == nil {
            return false
        }
        if p == nil , q == nil {
            return true
        }
        if p!.val != q!.val {
            return false
        }
        let lr = isSameTree(p!.left, q!.left)
        if lr == false {
            return false
        }
        let rr = isSameTree(p!.right, q!.right)
        if rr == false {
            return false
        }
        return true
    }
}
// @lc code=end

