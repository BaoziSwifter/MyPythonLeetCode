import Foundation

class Solution_102{

    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int){
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    var result: [[Int]] = []

    
    // DFS 深度优先搜索 递归
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let tree = root else {return []}
        func levelOrder(_ node: TreeNode, level: Int) {
            if result.count == level {
                result.append([node.val])
            } else {
                var tmp = result[level]
                tmp.append(node.val)
                result[level] = tmp
            }
            if let left = node.left {
                levelOrder(left, level: level + 1)
            }
            if let right = node.right {
                levelOrder(right, level: level + 1)
            }
        }
        levelOrder(tree, level: 0)
        return result
    }
    
    // BFS 广度优先
    func BFS_levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let tree = root else { return [] }
        //创建队列
        var queue: [TreeNode] = [tree]
        var result: [[Int]] = []
        //临时存储队列
        var nextLevelQueue: [TreeNode] = []
        while queue.count != 0 {
            var temp: [Int] = []
            for node in queue {
                temp.append(node.val)
                if let left = node.left {
                    nextLevelQueue.append(left)
                }
                if let right = node.right {
                    nextLevelQueue.append(right)
                }
            }
            result.append(temp)
            queue.removeAll()
            queue = nextLevelQueue
            nextLevelQueue.removeAll()
        }
        return result
    }

}
