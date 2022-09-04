//
//  559.-n-叉树的最大深度.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution559 {
    func maxDepth(_ root: NTreeNode?) -> Int {
        if root == nil { return 0 }
        var queue = [root!]
        var depth = 0
        while queue.isEmpty == false {
            depth += 1
            var tmpQ = [NTreeNode]()
            for i in queue {
                if i.children.count > 0 {
                    tmpQ += i.children
                }
            }
            queue = tmpQ
        }
        return depth
    }
}
