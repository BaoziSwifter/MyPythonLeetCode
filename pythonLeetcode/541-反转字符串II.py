#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/4 21:08
# @Author  : Beliefei
# @File    : 翻转字符串II.py
# @Software: PyCharm

"""
给定一个字符串和一个整数 k，你需要对从字符串开头算起的每个 2k 个字符的前k个字符进行反转。如果剩余少于 k 个字符，则将剩余的所有全部反转。如果有小于 2k 但大于或等于 k 个字符，则反转前 k 个字符，并将剩余的字符保持原样。

示例:

输入: s = "abcdefg", k = 2
输出: "bacdfeg"
要求:

该字符串只包含小写的英文字母。
给定字符串的长度和 k 在[1, 10000]范围内。
"""
class Solution:
    def reverseStr(self, s, k):
        """
        :type s: str
        :type k: int
        :rtype: str
        """

        """
         l = len(s)
        res = ''
        for i in range(0, l, 2 * k):
            res += s[i:i + k][::-1] + s[i + k:i + 2 * k]

        return res
        """
        l = len(s)
        handleString = ""
        length = l // (k*2)
        i = 0
        while i < length:
            handleString += s[i*2*k:(2*i+1)*k:1][::-1]
            handleString += s[(2*i+1)*k:2*(i+1)*k]
            i += 1
        left = l - 2*k*length
        if left > k:
            handleString += s[l-left:l-left+k][::-1]
            handleString += s[l-left+k:]
        else:
            handleString += s[l-left:][::-1]
        return handleString


if __name__ == '__main__':
    s = Solution()
    print("_______"+s.reverseStr("1234567890123",3))


