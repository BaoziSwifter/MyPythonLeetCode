//
//  222.-完全二叉树的节点个数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution222 {
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var level = 0
        var r = root
        while r?.left != nil {
            level += 1
            r = r?.left
        }
        var low = 1 << level, high = (1 << (level + 1)) - 1
        while low < high {
            let mid = low + (high - low + 1) / 2
            if exist(root, level, mid) {
                low = mid
            } else {
                high = mid - 1
            }
        }
        return low
    }
    func exist(_ root: TreeNode?, _ level: Int, _ k :Int) -> Bool {
        var bits = 1 << (level - 1)
        var node = root
        while node != nil && bits > 0 {
            if bits & k == 0 {
                node = node?.left
            } else {
                node = node?.right
            }
            bits >>= 1
        }
        return node != nil
    }
}
