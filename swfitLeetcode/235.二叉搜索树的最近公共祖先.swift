/*
 * @lc app=leetcode.cn id=235 lang=swift
 *
 * [235] 二叉搜索树的最近公共祖先
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class LowestCommonAncestorInSearchTreeSolution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let targetA = p!
        let targetB = q!
        var curNode = root
        while curNode != nil {
            let tmpNode = curNode!
            if tmpNode.val > targetA.val && tmpNode.val > targetB.val{
                curNode = tmpNode.left
            }else if tmpNode.val < targetA.val && tmpNode.val < targetB.val{
                curNode = tmpNode.right
            }else if tmpNode.val == targetB.val || tmpNode.val == targetA.val{
                return tmpNode
            } else{
                return curNode
            }
        }
        return nil
    }
}
// @lc code=end

