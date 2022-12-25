//
//  590.n-叉树的后序遍历.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution590 {
    func postorder(_ root: NTreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var queue = [NTreeNode]()
        var res = [Int]()
        queue.append(root!)
        while queue.isEmpty == false {
            let n = queue.popLast()!
            res.append(n.val)
            if n.children.count > 0 {
                queue.append(contentsOf: n.children)
            }
        }
        return res.reversed()
    }
}
