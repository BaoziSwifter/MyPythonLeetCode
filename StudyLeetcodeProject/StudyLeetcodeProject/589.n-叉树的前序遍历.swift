//
//  589.-n-叉树的前序遍历.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation



class Solution589 {
    func preorder(_ root: NTreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        let r = root
        var stack = [NTreeNode]()
        stack.append(r!)
        var res = [Int]()
        
        while stack.isEmpty == false {
            let n = stack.removeLast()
            res.append(n.val)
            if n.children.count > 0 {
                stack += n.children.reversed()
            }
        }
        return res
    }
}
