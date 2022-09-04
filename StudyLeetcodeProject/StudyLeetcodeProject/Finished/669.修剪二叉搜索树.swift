//
//  669.修剪二叉搜索树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

class Solution669 {
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let r = root else {
            return root
        }
        if r.val < low {
            return trimBST(r.right, low, high)
        }
        if r.val > high {
            return trimBST(r.left, low, high)
        }
        r.left = trimBST(r.left, low, high)
        r.right = trimBST(r.right, low, high)
        return root
    }
}
