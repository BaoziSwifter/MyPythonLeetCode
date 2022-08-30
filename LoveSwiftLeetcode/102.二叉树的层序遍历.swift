/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层序遍历
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [[Int]]() }
        var res = [[Int]]()
        var q = [TreeNode]()
        q.append(root!)
        while q.count > 0 {
            var tmpQ = [TreeNode]()
            var resL = [Int]()
            for qi in q {
                resL.append(qi.val)
                
                if let l = qi.left {
                    tmpQ.append(l)
                }
                if let r = qi.right {
                    tmpQ.append(r)
                }
            }
            q = tmpQ
            res.append(resL)
        }
        return res
    }
}
// @lc code=end

