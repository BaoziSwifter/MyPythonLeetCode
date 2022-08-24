//
//  515.在每个树行中找最大值.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

class Solution515 {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res
        }
        
        var q = [root]
        while q.isEmpty == false {
            var tmp = [TreeNode]()
            var value = Int.min
            for i in q {
                value = max(value, i.val)
                if let l = i.left {
                    tmp.append(l)
                }
                if let r = i.right {
                    tmp.append(r)
                }
            }
            res.append(value)
            q = tmp
        }
        return res
    }
}
