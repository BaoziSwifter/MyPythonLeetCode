#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/28 20:31
# @Author  : Beliefei
# @File    : 20-有效的括号.py
# @Software: PyCharm

"""

给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
注意空字符串可被认为是有效字符串。

示例 1:

输入: "()"
输出: true
示例 2:

输入: "()[]{}"
输出: true
示例 3:

输入: "(]"
输出: false
示例 4:

输入: "([)]"
输出: false
示例 5:

输入: "{[]}"
输出: true
"""

class Solution:
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        a = []
        b = {"{":"}","[":"]","(":")"}
        for charS in s:
            if "{[(".find(charS) >= 0:
                a.append(charS)
            else:

                if "}])".find(charS) >= 0:
                    if len(a) and charS == b[a[-1]]:
                        a.pop()
                    else:
                        return False
        if len(a):
            return False
        else:
            return True

if __name__ == '__main__':
    so = Solution()
    result = so.isValid("]")
    if result:
        print("++++")
    else:
        print("-----")
