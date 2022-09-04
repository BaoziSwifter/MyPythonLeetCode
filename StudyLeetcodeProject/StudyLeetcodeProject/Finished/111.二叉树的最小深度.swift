//
//  111.二叉树的最小深度.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/29.
//

import Foundation


class Solution111 {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var q = [TreeNode]()
        q.append(root!)
        var depth = 1
        while q.isEmpty == false {
            var tmpQ = [TreeNode]()
            for c in q {
                if c.left == nil && c.right == nil {
                    return depth
                }
                
                if let l = c.left {
                    tmpQ.append(l)
                }
                if let r = c.right {
                    tmpQ.append(r)
                }
                
            }
            depth += 1
            q = tmpQ
        }
        return depth
    }
}
