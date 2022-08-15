/*
 * @lc app=leetcode.cn id=236 lang=swift
 *
 * [236] 二叉树的最近公共祖先
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

class LowestCommonAncestorSolution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let cur = root else { return nil }
        guard let tmpP = p else { return q }
        guard let tmpQ = q else { return p }

        if cur === tmpP || cur === tmpQ {
            return cur
        }

        let left = lowestCommonAncestor(cur.left, p, q)
        let right = lowestCommonAncestor(cur.right, p, q)

        if left != nil && right != nil {
            return cur
        }

        if left != nil {
            return left
        }

        if right != nil {
            return right
        }
        return nil       
    }
    
    
    // 法2
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

      if root == nil || root === p || root === q {
        return root
      }
      //! 1. 以 root.left 为根节点，寻找 最近公共祖先
      let leftNode = lowestCommonAncestor2(root?.left,p,q)
      //! 2  以 root.right 为根节点，寻找 最近公共祖先
      let rightNode = lowestCommonAncestor2(root?.right,p,q)

      if leftNode != nil && rightNode != nil {
        return root
      }
      
        return (leftNode != nil) ? leftNode : rightNode
    
    }
}


// @lc code=end

