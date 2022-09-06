//
//  230.-二叉搜索树中第k小的元素.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution230 {
    var i = 0
    var finalVal: Int?
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func kth(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            kth(root.left)
            i += 1
            if i == k {
                finalVal = root.val
                return
            }
            kth(root.right)
        }
        kth(root)
        return finalVal ?? 0
    }
}
