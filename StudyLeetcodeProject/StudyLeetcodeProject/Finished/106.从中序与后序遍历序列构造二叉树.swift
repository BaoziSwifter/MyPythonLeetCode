//
//  106.从中序与后序遍历序列构造二叉树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

class Solution106 {
    var inOrderMap = [Int: Int]()
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for (i, v) in inorder.enumerated() {
            inOrderMap[v] = i
        }
        return build(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
    }
    
    func build(_ inOrder: [Int], _ inStart: Int, _ inEnd: Int,
               _ postOrder: [Int], _ postStart: Int, _ postEnd: Int) -> TreeNode? {
        if inStart > inEnd {
            return nil
        }
        
        let rootVal = postOrder[postEnd]
        let index = inOrderMap[rootVal]!
        let leftSize = index - inStart
        let root = TreeNode(rootVal)
        root.left = build(inOrder, inStart, index - 1, postOrder, postStart, postStart + leftSize - 1)
        root.right = build(inOrder, index + 1, inEnd, postOrder, postStart + leftSize, postEnd - 1)
        return root
    }
}
