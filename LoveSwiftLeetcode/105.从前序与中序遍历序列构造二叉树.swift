/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
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
    var inOrderMap = [Int: Int]()
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (i, v) in inorder.enumerated() {
            inOrderMap[v] = i
        }
        return build(preorder, 0, preorder.count - 1,
                     inorder, 0, inorder.count - 1)
    }
    func build(_ preorder: [Int], _ preStart: Int, _ preEnd: Int,
               _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd {
            return nil
        }
        let rootVal = preorder[preStart]
        // 查找 rootVal 在中序遍历数组中的位置
        let index = inOrderMap[rootVal]!
        let root = TreeNode(rootVal)
        let leftSize = index - inStart
        root.left = build(preorder, preStart + 1, preStart + leftSize,
                          inorder, inStart, index - 1)
        root.right = build(preorder, preStart + leftSize + 1, preEnd,
                           inorder, index + 1, inEnd)
        return root
    }
}
// @lc code=end

