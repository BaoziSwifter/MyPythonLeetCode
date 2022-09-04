//
//  107.-二叉树的层序遍历-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution107 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [[Int]]() }
        var res = [[Int]]()
        var q = [TreeNode]()
        q.append(root!)
        while q.count > 0 {
            var tmpQ = [TreeNode]()
            var resL = [Int]()
            for qi in q {
                resL.append(qi.val)
                
                if let l = qi.left {
                    tmpQ.append(l)
                }
                if let r = qi.right {
                    tmpQ.append(r)
                }
            }
            q = tmpQ
            res.append(resL)
        }
        return res.reversed()
    }
}
