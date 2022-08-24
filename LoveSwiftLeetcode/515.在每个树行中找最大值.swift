/*
 * @lc app=leetcode.cn id=515 lang=swift
 *
 * [515] 在每个树行中找最大值
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res
        }
        
        var q = [root]
        while q.isEmpty == false {
            var tmp = [TreeNode]()
            var value = Int.min
            for i in q {
                value = max(value, i.val)
                if let l = i.left {
                    tmp.append(l)
                }
                if let r = i.right {
                    tmp.append(r)
                }
            }
            res.append(value)
            q = tmp
        }
        return res
    }
}
// @lc code=end

