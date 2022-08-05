#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/4 19:02
# @Author  : Beliefei
# @File    : 键盘行.py
# @Software: PyCharm

"""
给定一个单词列表，只返回可以使用在键盘同一行的字母打印出来的单词。键盘如下图所示。
示例1:

输入: ["Hello", "Alaska", "Dad", "Peace"]
输出: ["Alaska", "Dad"]
注意:

你可以重复使用键盘上同一字符。
你可以假设输入的字符串将只包含字母。
"""

class Solution:
    def findWords(self, words):
        """
        :type words: List[str]
        :rtype: List[str]
        """

        """
        row1 = set("qwertyuiopQWERTYUIOP")
        row2 = set("asdfghjklASDFGHJKL")
        row3 = set("ZXCVBNMzxcvbnm")

        lst = list(filter(lambda x: set(x).issubset(row1) or set(x).issubset(row2) or set(x).issubset(row3), words))
        return(lst)
        """

        """
        f_line = 'qwertyuiop'
        s_line = 'asdfghjkl'
        t_line = 'zxcvbnm'
        res = []
        for i in words:
            if all([x in f_line for x in i.lower()]) or all([x in s_line for x in i.lower()]) or all([x in t_line for x in i.lower()]):
                res.append(i)
        return res
        """
        def rowKeyWords(subStringItem):
            topString = "qwertyuiop"
            middleString = "asdfghjkl"
            bottomString = "zxcvbnm"

            allKeywords = [topString,middleString,bottomString]
            aString = subStringItem[0].lower()
            for keyItemString in allKeywords:
                index = keyItemString.find(aString)
                if index != -1:
                    isInTheRow = True
                    for rearchString in subStringItem:
                        if keyItemString.find(rearchString.lower()) == -1:
                            return False

            return True

        stringList = []
        for item in words:
            if rowKeyWords(item):
                stringList.append(item)

        return stringList

if __name__ == '__main__':
    s = Solution()
    print(s.findWords(["Hello","Alaska","Dad","Peace"]))