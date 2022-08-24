/*
 * @lc app=leetcode.cn id=889 lang=swift
 *
 * [889] 根据前序和后序遍历构造二叉树
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
    var indexMap = [Int: Int]()
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for (i, v) in postorder.enumerated() {
            indexMap[v] = i
        }
        return build(preorder, 0, preorder.count - 1, postorder, 0, postorder.count - 1)
    }
    func build(_ preOrder: [Int], _ preStart: Int, _ preEnd: Int,
               _ postOrder: [Int], _ postStart: Int, _ postEnd: Int) -> TreeNode? {
        if preStart > preEnd {
            return nil
        }
        if preEnd == preStart {
            return TreeNode(preOrder[preEnd])
        }
        
        let rootVal = preOrder[preStart]
        // root.left 的值 是前序遍历的第二个元素
        // 通过前序和后续遍历构造二叉树的关键在于通过左子树的根节点
        // 确定 preorder 和 postorder 中左右树的元素区间
        let leftRootVal = preOrder[preStart + 1]
        // leftRootVal 在后续遍历数组中的索引
        let index = indexMap[leftRootVal]!
        // 左子树的元素个数
        let leftSize = index - postStart + 1
        let root = TreeNode(rootVal)
        // 递归构造左右子树
        root.left = build(preOrder, preStart + 1, preStart + leftSize, postOrder, postStart, index)
        root.right = build(preOrder, preStart
                            + leftSize + 1, preEnd, postOrder, index + 1, postEnd - 1)
        return root
        
    }
}
// @lc code=end

