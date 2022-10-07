//
//  652.寻找重复的子树.swift
//  StudyLeetcodeProject
//
//  Created by KKDlf on 2022/10/7.
//

import Foundation

class Solution652 {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var reslist = [TreeNode?]()
        var resDic = [Int :Int]()
        guard let root = root else { return [TreeNode?]() }
        @discardableResult
        func getSubTree(_ root: TreeNode?) -> String {
            guard let root = root else {
                return "#"
            }
            let resString = getSubTree(root.left) + "," + getSubTree(root.right) + "," + "\(root.val)"
            let hashKey = resString.hashValue
            var times = resDic[hashKey] ?? 0
            times += 1
            if times == 2 {
                reslist.append(root)
            }
            resDic[hashKey] = times
            return resString
        }
        
        getSubTree(root)
        return reslist
        
    }
}
