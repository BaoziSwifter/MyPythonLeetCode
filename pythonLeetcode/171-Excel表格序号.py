#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/5 12:34
# @Author  : Beliefei
# @File    : Excel表格序号.py
# @Software: PyCharm

"""
给定一个Excel表格中的列名称，返回其相应的列序号。

例如，

    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28
    ...
示例 1:

输入: "A"
输出: 1
示例 2:

输入: "AB"
输出: 28
示例 3:

输入: "ZY"
输出: 701

"""

class Solution:
    def titleToNumber(self, s):
        """
        :type s: str
        :rtype: int
        """
        su = 0
        for i in range(len(s)):
            num = ord(s[i])
            num -= 64
            print(num)
            su += 26**(len(s)-i-1)*num
        return su

    """
        sum = 0
        for c in s:
            sum = sum*26 + ord(c) - 64 # 64 = ord('A') - 1
        return sum
    """

if __name__ == '__main__':
    s = Solution()
    print(s.titleToNumber("A"))





