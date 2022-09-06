//
//  108.-将有序数组转换为二叉搜索树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        return dfs(nums, 0, nums.count - 1)
    }
    
    func dfs(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        if left == right {
            return TreeNode(nums[left])
        }
        let mid = (left + right) / 2
        let root = TreeNode(nums[mid])
        root.left = dfs(nums, left, mid - 1)
        root.right = dfs(nums, mid + 1, right)
        return root
    }
}
