//
//  145.二叉树的后序遍历.swift
//  StudyLeetcodeProject
//
//  Created by 段龙飞 on 2022/9/29.
//

import Foundation

class Solution145 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var stack = [root]
        var res = [Int]()
        while stack.isEmpty == false {
            let p = stack.popLast()!
            res.append(p.val)
            if p.left != nil {
                stack.append(p.left!)
            }
            if p.right != nil {
                stack.append(p.right!)
            }
        }
        return res.reversed()
    }
}
