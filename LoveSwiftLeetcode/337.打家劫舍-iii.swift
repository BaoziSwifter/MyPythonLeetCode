/*
 * @lc app=leetcode.cn id=337 lang=swift
 *
 * [337] 打家劫舍 III
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
    func robOrNot(_ root: TreeNode?) -> (Int, Int) {
        guard let r = root else {
            return (0, 0)
        }
        let (ll, lr) = robOrNot(r.left)
        let (rl, rr) = robOrNot(r.right)
        return (lr + rr + r.val, max(ll, lr) + max(rl, rr))
    }
    
    func rob(_ root: TreeNode?) -> Int {
        let (l, r) = robOrNot(root)
        return max(l, r)
    }
}
// @lc code=end

