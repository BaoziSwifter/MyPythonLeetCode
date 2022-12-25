//
//  95.-不同的二叉搜索树-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation


class Solution95 {
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [TreeNode?]() }
        func buildRootTree(_ start: Int, _ end: Int) -> [TreeNode?] {
            var res = [TreeNode?]()
            if end < start {
                res.append(nil)
                return res
            }
            for i in start ... end {
                let lefts = buildRootTree(start, i - 1)
                let rights = buildRootTree(i + 1, end)
                for l in lefts {
                    for r in rights {
                        let root = TreeNode(i)
                        root.left = l
                        root.right = r
                        res.append(root)
                    }
                }
            }
            return res
        }
       return buildRootTree(1, n)
        
    }
}
