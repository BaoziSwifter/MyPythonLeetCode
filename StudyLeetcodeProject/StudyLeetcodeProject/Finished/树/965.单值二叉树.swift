//
//  965.-单值二叉树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution965 {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        func travse(_ root: TreeNode?, _ defaultVal: Int) -> Bool {
            guard let root = root else {
                return true
            }
            if root.val != defaultVal {
                return false
            }
            if travse(root.left, defaultVal) == false {
                return false
            }
            if travse(root.right, defaultVal) == false {
                return false
            }
            return true
        }
        return travse(root, root.val)
    }
}
