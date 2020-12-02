#
# @lc app=leetcode.cn id=114 lang=python
#
# [114] 二叉树展开为链表
#
# https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/description/
#
# algorithms
# Medium (65.91%)
# Likes:    208
# Dislikes: 0
# Total Accepted:    18.4K
# Total Submissions: 27.9K
# Testcase Example:  '[1,2,5,3,4,null,6]'
#
# 给定一个二叉树，原地将它展开为链表。
# 
# 例如，给定二叉树
# 
# ⁠   1
# ⁠  / \
# ⁠ 2   5
# ⁠/ \   \
# 3   4   6
# 
# 将其展开为：
# 
# 1
# ⁠\
# ⁠ 2
# ⁠  \
# ⁠   3
# ⁠    \
# ⁠     4
# ⁠      \
# ⁠       5
# ⁠        \
# ⁠         6
# 
#


# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

# 225/225 cases passed (16 ms)
# Your runtime beats 98.85 % of python submissions
# Your memory usage beats 38.35 % of python submissions (12.1 MB)
class Solution1(object):
    def flatten(self, root):
        """
        :type root: TreeNode
        :rtype: None Do not return anything, modify root in-place instead.
        """
        def traceFlatten(root):
            if root is None:
                return root
            else:
                tmpRight = root.right
                tmpRoot= root
                if root.left:
                    root.right = root.left
                    tmpRoot = traceFlatten(root.right)
                    root.left = None
                
                if tmpRight:
                    tmpRoot.right = tmpRight
                    tmpRoot = traceFlatten(tmpRight)
                return tmpRoot              
                
        traceFlatten(root)

# @lc code=start
# 225/225 cases passed (32 ms)
# Your runtime beats 43.02 % of python submissions
# Your memory usage beats 36.84 % of python submissions (12.1 MB)
class Solution(object):
    def flatten(self, root):   
        while root:
            if root.left:
                real_right = root.left
                while real_right.right: real_right = real_right.right
                real_right.right = root.right
                root.right = root.left
                root.left = None
            root = root.right 

# @lc code=end

