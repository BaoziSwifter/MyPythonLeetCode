/*
 * @lc app=leetcode.cn id=108 lang=swift
 *
 * [108] 将有序数组转换为二叉搜索树
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        return dfs(nums, 0, nums.count - 1)
    }
    
    func dfs(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        if left == right {
            return TreeNode(nums[left])
        }
        let mid = (left + right) / 2
        let root = TreeNode(nums[mid])
        root.left = dfs(nums, left, mid - 1)
        root.right = dfs(nums, mid + 1, right)
        return root
    }
}
// @lc code=end

