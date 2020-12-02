#
# @lc app=leetcode.cn id=105 lang=python
#
# [105] 从前序与中序遍历序列构造二叉树
#
# https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
#
# algorithms
# Medium (62.44%)
# Likes:    288
# Dislikes: 0
# Total Accepted:    34K
# Total Submissions: 54K
# Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
#
# 根据一棵树的前序遍历与中序遍历构造二叉树。
# 
# 注意:
# 你可以假设树中没有重复的元素。
# 
# 例如，给出
# 
# 前序遍历 preorder = [3,9,20,15,7]
# 中序遍历 inorder = [9,3,15,20,7]
# 
# 返回如下的二叉树：
# 
# ⁠   3
# ⁠  / \
# ⁠ 9  20
# ⁠   /  \
# ⁠  15   7
# 
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

# 203/203 cases passed (176 ms)
# Your runtime beats 47.52 % of python submissions
# Your memory usage beats 11.94 % of python submissions (86.4 MB)
class Solution(object):
    def buildTree(self, preorder, inorder):
        if not preorder:
            return None

        rootValue = preorder[0]

        index = inorder.index(rootValue)

        root = TreeNode(rootValue)

        root.left = self.buildTree(preorder[1:index+1],inorder[:index])
        root.right = self.buildTree(preorder[index+1:],inorder[index+1:])
        return root
        
# @lc code=end

