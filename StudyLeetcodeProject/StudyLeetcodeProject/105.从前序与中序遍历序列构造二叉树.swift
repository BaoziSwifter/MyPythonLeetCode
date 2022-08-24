//
//  105.从前序与中序遍历序列构造二叉树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution105 {
    var inOrderMap = [Int: Int]()
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (i, v) in inorder.enumerated() {
            inOrderMap[v] = i
        }
        return build(preorder, 0, preorder.count - 1,
                     inorder, 0, inorder.count - 1)
    }
    func build(_ preorder: [Int], _ preStart: Int, _ preEnd: Int,
               _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd {
            return nil
        }
        let rootVal = preorder[preStart]
        // 查找 rootVal 在中序遍历数组中的位置
        let index = inOrderMap[rootVal]!
        let root = TreeNode(rootVal)
        let leftSize = index - inStart
        root.left = build(preorder, preStart + 1, preStart + leftSize,
                          inorder, inStart, index - 1)
        root.right = build(preorder, preStart + leftSize + 1, preEnd,
                           inorder, index + 1, inEnd)
        return root
    }
}
