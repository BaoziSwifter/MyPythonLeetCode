//
//  114.-二叉树展开为链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution114 {
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        flatten(root.left)
        flatten(root.right)
        // 后序遍历处理
        let left = root.left
        let right = root.right
        root.left = nil
        root.right = left
        var r = root
        while r.right != nil {
            r = r.right!
        }
        r.right = right
    }
}
