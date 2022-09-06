//
//  103.-二叉树的锯齿形层序遍历.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else {
            return []
        }
        var directToRight = true
        var queue = [r]
        var res = [[Int]]()
        while !queue.isEmpty {
            var tmp = [TreeNode]()
            var tmpRes = [Int]()
            for n in queue {
                tmpRes.append(n.val)
                    if let l = n.left {
                        tmp.append(l)
                    }
                    if let r = n .right {
                        tmp.append(r)
                    }
            }
            queue = tmp
            if directToRight {
                directToRight = false
                res.append(tmpRes)
            } else {
                directToRight = true
                res.append(tmpRes.reversed())
            }
        }
        return res
    }
}
