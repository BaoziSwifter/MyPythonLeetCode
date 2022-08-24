//
//  654.-最大二叉树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution654 {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        var maxVal = Int.min
        var maxIndex = 0
        for i in 0..<nums.count {
            if nums[i] > maxVal {
                maxVal = nums[i]
                maxIndex = i
            }
        }
        let root = TreeNode(maxVal)
        root.left = constructMaximumBinaryTree(Array(nums[0..<maxIndex]))
        root.right = constructMaximumBinaryTree(Array(nums[maxIndex+1...(nums.count - 1)]))
        
        return root
    }
}
