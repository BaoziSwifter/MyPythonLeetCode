#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author  : Beliefei
# @Software: PyCharm

"""
给定一个正整数，检查他是否为交替位二进制数：换句话说，就是他的二进制数相邻的两个位数永不相等。

示例 1:

输入: 5
输出: True
解释:
5的二进制数是: 101
示例 2:

输入: 7
输出: False
解释:
7的二进制数是: 111
示例 3:

输入: 11
输出: False
解释:
11的二进制数是: 1011
 示例 4:

输入: 10
输出: True
解释:
10的二进制数是: 1010
"""

class Solution:
    def hasAlternatingBits(self, n):
        """
        :type n: int
        :rtype: bool
        """
        """
        n = bin(n)
        if '11' not in n and '00' not in n:
            return True
        else:
            return False
        """

        """
        s=bin(n)[2:]
        ln=len(s)
        for i in range(1,ln):
            if s[i]==s[i-1]:
                return False
        return True
        """
        s = bin(n)
        subS = s[2:]
        lastNum = ""
        for strIndex in subS:
            if strIndex == lastNum:
                return False
            else:
                lastNum = strIndex

        return True

if __name__ == '__main__':
    s = Solution()
    result = s.hasAlternatingBits(3)
    if result:
        print("success")
    else:
        print("fail")