/*
 * @lc app=leetcode.cn id=103 lang=swift
 *
 * [103] 二叉树的锯齿形层序遍历
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else {
            return []
        }
        var directToRight = true
        var queue = [r]
        var res = [[Int]]()
        while !queue.isEmpty {
            var tmp = [TreeNode]()
            var tmpRes = [Int]()
            for n in queue {
                tmpRes.append(n.val)
                    if let l = n.left {
                        tmp.append(l)
                    }
                    if let r = n .right {
                        tmp.append(r)
                    }
            }
            queue = tmp
            if directToRight {
                directToRight = false
                res.append(tmpRes)
            } else {
                directToRight = true
                res.append(tmpRes.reversed())
            }
        }
        return res
    }
}
// @lc code=end

