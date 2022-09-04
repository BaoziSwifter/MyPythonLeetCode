//
//  538.-把二叉搜索树转换为累加树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution538 {
    var sumV = 0
    @discardableResult
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else {
            return nil
        }
        convertBST(r.right)
        sumV += r.val
        r.val = sumV
        convertBST(r.left)
        return r
    }
}
