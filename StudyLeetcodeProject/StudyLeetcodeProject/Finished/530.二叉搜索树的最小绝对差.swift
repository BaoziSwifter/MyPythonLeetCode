//
//  530.-二叉搜索树的最小绝对差.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution530 {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
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
