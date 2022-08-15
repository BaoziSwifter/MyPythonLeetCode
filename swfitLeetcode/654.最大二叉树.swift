/*
 * @lc app=leetcode.cn id=654 lang=swift
 *
 * [654] 最大二叉树
 */

// @lc code=start

class ConstructMaximumBinaryTreeSolution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return build(nums, 0, nums.count-1)
    }

    func build(_ nums: [Int],_ low: Int,_ hig: Int) -> TreeNode? {
        if low > hig {
            return nil
        }
        var maxVal = Int.min , index = -1
        for i in low...hig {
            if nums[i] > maxVal {
                maxVal = nums[i]
                index = i
            }
        }
        let root = TreeNode(maxVal)
        root.left = build(nums,low,index-1)
        root.right = build(nums,index+1,hig)
        return root

    }
}
// @lc code=end

