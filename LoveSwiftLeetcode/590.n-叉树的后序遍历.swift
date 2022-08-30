/*
 * @lc app=leetcode.cn id=590 lang=swift
 *
 * [590] N 叉树的后序遍历
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
    func postorder(_ root: Node?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var r = root
        var queue = [Node]()
        var res = [Int]()
        queue.append(r!)
        while queue.isEmpty == false {
            if queue.isEmpty == false {
                let n = queue.removeFirst()
                res.append(n.val)
                if n.children.count > 0 {
                    queue += n.children.reversed()
                }
            }
        }
        return res.reversed()   	
    }
}
// @lc code=end

