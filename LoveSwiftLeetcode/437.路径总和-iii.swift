/*
 * @lc app=leetcode.cn id=437 lang=swift
 *
 * [437] 路径总和 III
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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        func deepSumCnt(_ root: TreeNode?, _ targetSum: Int) -> Int {
            if root == nil {
                return 0
            }
            let leftVal = targetSum - root!.val
            var totalCnt = 0
            if leftVal == 0 {
                totalCnt += 1
            }
            totalCnt += deepSumCnt(root?.left, leftVal)
            totalCnt += deepSumCnt(root?.right, leftVal)
            return totalCnt
        }
        guard let root = root else {
            return 0
        }
        return pathSum(root.left, targetSum) + pathSum(root.right, targetSum) + deepSumCnt(root, targetSum)
    }
}
// @lc code=end

