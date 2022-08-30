/*
 * @lc app=leetcode.cn id=559 lang=swift
 *
 * [559] N 叉树的最大深度
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
    func maxDepth(_ root: Node?) -> Int {
        if root == nil { return 0 }
        var queue = [root!]
        var depth = 0
        while queue.isEmpty == false {
            depth += 1
            var tmpQ = [Node]()
            for i in queue {
                if i.children.count > 0 {
                    tmpQ += i.children
                }
            }
            queue = tmpQ
        }
        return depth        
    }
}
// @lc code=end

