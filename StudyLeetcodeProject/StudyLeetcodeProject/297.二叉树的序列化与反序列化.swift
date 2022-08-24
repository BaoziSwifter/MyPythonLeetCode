//
//  297.二叉树的序列化与反序列化.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

class Codec297 {
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
