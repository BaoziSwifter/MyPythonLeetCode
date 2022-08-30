/*
 * @lc app=leetcode.cn id=589 lang=swift
 *
 * [589] N 叉树的前序遍历
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func preorder(_ root: Node?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var r = root
        var stack = [Node]()
        stack.append(r!)
        var res = [Int]()
        
        while stack.isEmpty == false {
            let n = stack.removeLast()
            res.append(n.val)
            if n.children.count > 0 {
                stack += n.children.reversed()
            }
        }
        return res	
    }
}
// @lc code=end

