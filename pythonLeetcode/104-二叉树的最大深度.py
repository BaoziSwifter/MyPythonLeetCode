#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/4 15:40
# @Author  : Beliefei
# @File    : 二叉树的最大深度.py
# @Software: PyCharm

"""

给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。

示例：
给定二叉树 [3,9,20,null,null,15,7]，

    3
   / \
  9  20
    /  \
   15   7
返回它的最大深度 3 。

"""

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def maxDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        """
        return 0 if not root else 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))
        """

        """
        if root == None:
                    return 0
                return max(self.maxDepth(root.left), self.maxDepth(root.right)) + 1
        """
        """
        if not root:
            return 0
        return 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))
        """
        if root == None:
            return 0
        leftDeepth = self.maxDepth(root.left)
        rightDeepth = self.maxDepth(root.right)
        if leftDeepth > rightDeepth:
            return leftDeepth+1
        else:
            return rightDeepth+1


