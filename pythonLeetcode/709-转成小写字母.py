#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/8/30 18:02
# @Author  : Beliefei
# @File    : 转成小写字母.py
# @Software: PyCharm
class Solution:
    def toLowerCase(self, str):
        """
        :type str: str
        :rtype: str
        """
        return str.lower()

if __name__ == '__main__':
    a = Solution()
    a.toLowerCase("AAAA")