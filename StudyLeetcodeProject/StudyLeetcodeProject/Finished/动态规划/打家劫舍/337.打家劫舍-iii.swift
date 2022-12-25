//
//  337.打家劫舍-iii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/30.
//

import Foundation

class Solution337 {
    
    func robOrNot(_ root: TreeNode?) -> (Int, Int) {
        guard let r = root else {
            return (0, 0)
        }
        let (ll, lr) = robOrNot(r.left)
        let (rl, rr) = robOrNot(r.right)
        return (lr + rr + r.val, max(ll, lr) + max(rl, rr))
    }
    
    func rob(_ root: TreeNode?) -> Int {
        let (l, r) = robOrNot(root)
        return max(l, r)
    }
}
