import Foundation
// leetcode 104 二叉树最大深度
class Solution_104 {
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right:TreeNode?
        init() {
            self.val = 0;self.left = nil; self.right = nil
        }
        init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
        // dfs递归
        func maxDepth(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            let leftDepth = maxDepth(root.left)
            let rightDepth = maxDepth(root.right)
            return max(leftDepth, rightDepth) + 1
        }
        
        // dfs 非递归
        func dfsMaxDepth(_ root: TreeNode? ) -> Int {
            guard let root = root else {
                return 0
            }
            var track = [(TreeNode, Int)]()
            track.append((root, 1))
            var maxLevel = -1
            while !track.isEmpty {
                let last = track.removeLast()
                let level = last.1
                if let left = last.0.left {
                    track.append((left, level+1))
                }
                if let right = last.0.right {
                    track.append((right, level+1))
                }
                maxLevel = max(maxLevel, level)
            }
            return maxLevel
        }
        
        // bfs 非递归
        func bfsMaxDepth(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            var queue = [TreeNode]()
            queue.append(root)
            var level = 0
            while !queue.isEmpty {
                for _ in 0..<queue.count {
                    let first = queue.removeFirst()
                    if let left = first.left {
                        queue.append(left)
                    }
                    if let right =  first.right {
                        queue.append(right)
                    }
                }
                level += 1
                
            }
            return level
        }
    }
}
