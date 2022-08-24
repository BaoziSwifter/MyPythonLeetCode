/*
 * @lc app=leetcode.cn id=297 lang=swift
 *
 * [297] 二叉树的序列化与反序列化
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    fileprivate let SEP: Character = ","
    fileprivate let NULL: Character = "#"
    fileprivate var serialStr: String = ""
    
    func serialize(_ root: TreeNode?) -> String {
        serialStr = ""
        traverseStr(root)
        return serialStr
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.count == 0 {
            return nil
        }
        let nodes = Array(data.split(separator: SEP))
        return traverseDeserialize(nodes)
    }
    var nodeStart = 0
    private func traverseDeserialize(_ nodes: [String.SubSequence]) -> TreeNode? {
        if nodeStart > nodes.count {
            return nil
        }
        if nodes[nodeStart] == String(NULL) {
            nodeStart += 1
            return nil
        }
        let rootVal = Int(nodes[nodeStart])!
        nodeStart += 1
        let root = TreeNode(rootVal)
        root.left = traverseDeserialize(nodes)
        root.right = traverseDeserialize(nodes)
        
        return root
    }
    
    func traverseStr(_ root: TreeNode?) {
        if root == nil {
            serialStr.append(NULL)
            serialStr.append(SEP)
            return
        }
        serialStr.append(String(root!.val))
        serialStr.append(SEP)
        
        traverseStr(root?.left)
        traverseStr(root?.right)
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
// @lc code=end

