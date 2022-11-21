//
//  700.-二叉搜索树中的搜索.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution700 {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var res: TreeNode?
        func dfs(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            if r.val == val {
                res = r
                return
            } else if r.val > val {
                dfs(r.left)
            } else {
                dfs(r.right)
            }
        }
        dfs(root)
        return res
    }
}
