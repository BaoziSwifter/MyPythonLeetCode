#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/5 12:14
# @Author  : Beliefei
# @File    : 转置矩阵.py
# @Software: PyCharm

"""
给定一个矩阵 A， 返回 A 的转置矩阵。

矩阵的转置是指将矩阵的主对角线翻转，交换矩阵的行索引与列索引。



示例 1：

输入：[[1,2,3],[4,5,6],[7,8,9]]
输出：[[1,4,7],[2,5,8],[3,6,9]]
示例 2：

输入：[[1,2,3],[4,5,6]]
输出：[[1,4],[2,5],[3,6]]


提示：

1 <= A.length <= 1000
1 <= A[0].length <= 1000
"""


class Solution:
    def transpose(self, A):
        """
        :type A: List[List[int]]
        :rtype: List[List[int]]
        """

        """
        return list(zip(*A))

        return [[A[j][i] for j in range(len(A))] for i in range(len(A[0]))]

        return [list(row) for row in zip(*A)]
        """
        L = []
        for i in range(len(A[0])):
            B = []
            for j in range(len(A)):
                B.append(A[j][i])
            L.append(B)

        return L
