//
//  98.-验证二叉搜索树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution98 {
    var lastVal = Int.min
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if !isValidBST(root.left) {
            return false
        }
        if root.val <= lastVal {
            return false
        } else {
            lastVal = root.val
        }
        return isValidBST(root.right)
    }
}
