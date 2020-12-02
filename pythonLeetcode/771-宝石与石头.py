#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/8/30 17:36
# @Author  : Beliefei
# @File    : 宝石与石头.py
# @Software: PyCharm

"""
给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。

    J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。

示例 1:

    输入: J = "aA", S = "aAAbbbb"
    输出: 3
示例 2:

    输入: J = "z", S = "ZZ"
    输出: 0
"""
class Solution:
    def numJewelsInStones1(self, J, S):
        count = 0
        for value in S:
            int isFind = 0
            for key in J:
                if key == value:
                    isFind = 1
                    break
            count += 1
        return count

    def numJewelsInStones(self, J, S):
        count = 0
        for v in J:
            sum+=S.count(v)
        return  count



def testDict():
    myDict = {"A":0,"B":1}
    try:
        value = myDict["C"]
        print(value)
    except ValueError:
        print("cuowu")




if __name__ == '__main__':
    testDict()