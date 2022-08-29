/*
 * @lc app=leetcode.cn id=111 lang=swift
 *
 * [111] 二叉树的最小深度
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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var q = [TreeNode]()
        q.append(root!)
        var depth = 1
        while q.isEmpty == false {
            var tmpQ = [TreeNode]()
            for c in q {
                if c.left == nil && c.right == nil {
                    return depth
                }
                
                if let l = c.left {
                    tmpQ.append(l)
                }
                if let r = c.right {
                    tmpQ.append(r)
                }
                
            }
            depth += 1
            q = tmpQ
        }
        return depth
    }
}
// @lc code=end

