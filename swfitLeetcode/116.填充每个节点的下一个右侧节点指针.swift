/*
 * @lc app=leetcode.cn id=116 lang=swift
 *
 * [116] 填充每个节点的下一个右侧节点指针
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class ConnectNodeSolution {
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return root
        }
        connectTwo(root?.left, root?.right)
        return root
    }
    func connectTwo(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil {
            return 
        }

        left?.next = right 
        connectTwo(left?.left, left?.right)
        connectTwo(right?.left, right?.right)

        connectTwo(left?.right, right?.left)
    }
}
// @lc code=end

