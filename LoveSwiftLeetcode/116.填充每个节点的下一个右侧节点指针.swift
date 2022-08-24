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

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        var q = [root]
        while q.isEmpty == false {
            var tmp = [Node]()
            let cnt = q.count
            for i in 0..<cnt {
                if i < cnt - 1 {
                    q[i].next = q[i + 1]
                }
                if let l = q[i].left {
                    tmp.append(l)
                }
                if let r = q[i].right {
                    tmp.append(r)
                }
            }
            q = tmp
        }
        return root
    }
}
// @lc code=end

