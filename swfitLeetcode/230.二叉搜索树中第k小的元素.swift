/*
 * @lc app=leetcode.cn id=230 lang=swift
 *
 * [230] 二叉搜索树中第K小的元素
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
class KthSmallestSolution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var myStack = [TreeNode]()
        var cur = root
        var target = 0
        while true {

            if let a = cur{
                myStack.append(a)
                cur = a.left
                
            }else{
                target += 1
                cur = myStack.popLast()
                if target == k {
                    return cur!.val
                }
                cur = cur?.right
            }

        }
    }
}
// @lc code=end

