/*
 * @lc app=leetcode.cn id=654 lang=swift
 *
 * [654] 最大二叉树
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        var maxVal = Int.min
        var maxIndex = 0
        for i in 0..<nums.count {
            if nums[i] > maxVal {
                maxVal = nums[i]
                maxIndex = i
            }
        }
        let root = TreeNode(maxVal)
        root.left = constructMaximumBinaryTree(Array(nums[0..<maxIndex]))
        root.right = constructMaximumBinaryTree(Array(nums[(maxIndex+1)..<nums.count]))
        
        return root
    }
}
// @lc code=end

