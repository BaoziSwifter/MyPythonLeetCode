#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/6 18:06
# @Author  : Beliefei
# @File    : N叉树的最大深度1.py
# @Software: PyCharm

"""
给定一个N叉树，找到其最大深度。

最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。

例如，给定一个 3叉树 :





我们应返回其最大深度，3。

说明:

树的深度不会超过 1000。
树的节点总不会超过 5000。
"""

class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children

class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """

        """
        if not root:
            return 0
        if not root.children:
            return 1
        depth = 1+max(self.maxDepth(child) for child in root.children)
        return depth
        """
        if root == None:
            return 0

        if root.children == None:
            return 1
        else:
            s = 0
            for item in root.children:
                n = self.maxDepth(item)
                if n > s:
                    s = n
            return 1+s
