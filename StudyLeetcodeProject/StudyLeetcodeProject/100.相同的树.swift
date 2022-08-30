//
//  100.-相同的树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil , q != nil {
            return false
        }
        if p != nil , q == nil {
            return false
        }
        if p == nil , q == nil {
            return true
        }
        if p!.val != q!.val {
            return false
        }
        let lr = isSameTree(p!.left, q!.left)
        if lr == false {
            return false
        }
        let rr = isSameTree(p!.right, q!.right)
        if rr == false {
            return false
        }
        return true
    }
}
