//
//  783.-二叉搜索树节点最小距离.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution783 {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var res = Int.max, pre = -1
        func dfs(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            dfs(r.left)
            if pre != -1 && r.val - pre < res {
                res = r.val - pre
            }
            
            pre = r.val
            dfs(r.right)
        }
        dfs(root)
        return res
    }
}
