#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/8/30 18:56
# @Author  : Beliefei
# @File    : 明汉的距离.py
# @Software: PyCharm
"""
两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

给出两个整数 x 和 y，计算它们之间的汉明距离。

注意：
0 ≤ x, y < 231.

示例:

输入: x = 1, y = 4

输出: 2

解释:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

上面的箭头指出了对应二进制位不同的位置。
"""
class Solution:
    def hammingDistance(self, x, y):
        """
        :type x: int
        :type y: int
        :rtype: int
        """
        """
        return bin(x^y).count('1')
        """
        """
        result = 0
        a = x^y
        while a > 0:
            if a%2==1:
                result += 1
            a //= 2
        return result
        """

        """
        temp = x ^ y
        count = 0
        while temp != 0:
            if temp % 2 != 0:
                count += 1
            temp = temp // 2
        return count
        """
        s = bin(x^y)
        total = 0
        for i in s:
            if i == '1':
                total += 1

        return total

