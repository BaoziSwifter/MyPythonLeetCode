#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/5 15:07
# @Author  : Beliefei
# @File    : N叉树后序遍历.py
# @Software: PyCharm

"""
给定一个N叉树，返回其节点值的后序遍历。



例如，给定一个 3叉树 :







返回其后序遍历: [5,6,3,2,4,1].
递归法很简单，你可以使用迭代法完成此题吗?
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
class Solution(object):
    def postorder(self, root):
        """
        if not root:
            return []
        # 迭代法就是自己模拟栈
        stack = [root]
        res = []
        while stack:
            node = stack.pop()
            for child in node.children:
                stack.append(child)
            res.append(node.val)
        return res[::-1]

        """

        """
        if root is None:
            return []
        ret = []
        for node in root.children:
            ret.extend(self.postorder(node))
        ret.append(root.val)
        return ret
        """
        s = []
        if not root:
            return []
        for item in root.children:
            s1 = self.postorder(item)
            for i in s1:
                s.append(i)
        s.append(root.val)
        return s