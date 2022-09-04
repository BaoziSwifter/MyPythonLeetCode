//
//  124.二叉树中的最大路径和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation


class Solution124 {
    var res = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        oneSideMax(root)
        return res
    }
    @discardableResult
    func oneSideMax(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let leftMaxValue = max(0, oneSideMax(root?.left))
        let rightMaxValue = max(0, oneSideMax(root?.right))
        // 后续处理
        let curMaxValue = root!.val + leftMaxValue + rightMaxValue
        res = max(res, curMaxValue)
        // 实现函数定义 左右子树的最大单边路径加上根节点的值，就是从根节点root为起点的最大单边路径和
        return max(leftMaxValue, rightMaxValue) + root!.val
        
    }
}
