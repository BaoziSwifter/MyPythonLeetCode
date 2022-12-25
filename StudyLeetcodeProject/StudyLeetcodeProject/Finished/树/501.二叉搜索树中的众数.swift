//
//  501.-二叉搜索树中的众数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution501 {
    func findMode(_ root: TreeNode?) -> [Int] {
        var dict = [Int: Int]()
        var maxCount = 0
        func inorder(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            inorder(r.left)
            dict[r.val, default: 0] += 1
            maxCount = max(maxCount, dict[r.val]!)
            inorder(r.right)
        }
        inOrder(root: root)
        var res = [Int]()
        for (k, v) in dict {
            if v == maxCount {
                res.append(k)
            }
        }
        return res
    }
    
    func findMode_opt(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        var maxCount = 0
        var preNum = Int.max
        var preCount = 0
        func dfs(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            dfs(r.left)
            if r.val != preNum {
                if preCount > maxCount {
                    ans.removeAll()
                    maxCount = preNum
                    ans.append(r.val)
                } else if preCount == maxCount {
                    ans.append(preNum)
                }
                preNum = r.val
                preCount = 1
            } else {
                preCount += 1
            }
            dfs( r.right)
        }
        dfs(root)
        // 收尾
        if preNum > maxCount {
            ans.removeAll()
            ans.append(preNum)
        } else if preCount == maxCount {
            ans.append(preNum)
        }
        
        return ans
    }
}
