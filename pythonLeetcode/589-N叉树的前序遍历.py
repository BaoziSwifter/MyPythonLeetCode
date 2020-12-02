#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/6 18:15
# @Author  : Beliefei
# @File    : N叉树的前序遍历.py
# @Software: PyCharm

"""
给定一个N叉树，返回其节点值的前序遍历。



例如，给定一个 3叉树 :







返回其前序遍历: [1,3,5,6,2,4]。
"""

class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children

class Solution(object):
    def preorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        s = []
        if not root:
            return s
        else:
            s.append(root.val)
            for item in root.children:
                s.extend(self.preorder(item))
        return s