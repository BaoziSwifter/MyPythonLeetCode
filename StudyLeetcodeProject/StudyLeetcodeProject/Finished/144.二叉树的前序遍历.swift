//
//  144.二叉树的前序遍历.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution144 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var queue = [root]
        var res = [Int]()
        while !queue.isEmpty {
            let q = queue.removeLast()
            res.append(q.val)
            if let r = q.right {
                queue.append(r)
            }
            if let l = q.left {
                queue.append(l)
            }
        }
        return res
    }
}
