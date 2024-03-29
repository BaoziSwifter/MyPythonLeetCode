/*
 * @lc app=leetcode.cn id=538 lang=swift
 *
 * [538] 把二叉搜索树转换为累加树
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
    var sumV = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else {
            return nil
        }
        convertBST(r.right)
        sumV += r.val
        r.val = sumV
        convertBST(r.left)
        return r
    }
}
// @lc code=end

