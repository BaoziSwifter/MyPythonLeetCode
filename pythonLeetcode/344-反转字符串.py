#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/4 18:40
# @Author  : Beliefei
# @File    : 翻转字符串.py
# @Software: PyCharm

"""
编写一个函数，其作用是将输入的字符串反转过来。

示例 1:

输入: "hello"
输出: "olleh"
示例 2:

输入: "A man, a plan, a canal: Panama"
输出: "amanaP :lanac a ,nalp a ,nam A"
"""
class Solution:
    def reverseString(self, s):
        """
        :type s: str
        :rtype: str
        """
        s = s[::-1]
        return s


if __name__ == '__main__':
    s = Solution()

    print(s.reverseString("hello"))