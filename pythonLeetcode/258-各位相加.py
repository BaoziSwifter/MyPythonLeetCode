#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/5 13:18
# @Author  : Beliefei
# @File    : 各位相加.py
# @Software: PyCharm

"""
给定一个非负整数 num，反复将各个位上的数字相加，直到结果为一位数。

示例:

输入: 38
输出: 2
解释: 各位相加的过程为：3 + 8 = 11, 1 + 1 = 2。 由于 2 是一位数，所以返回 2。
你可以不使用循环或者递归，且在 O(1) 时间复杂度内解决这个问题吗？
"""

class Solution:
    def addDigits(self, num):
        """
        :type num: int
        :rtype: int

    另一个方法比较简单，可以举例说明一下。假设输入的数字是一个5位数字num，则num的各位分别为a、b、c、d、e。

    有如下关系：num = a * 10000 + b * 1000 + c * 100 + d * 10 + e

    即：num = (a + b + c + d + e) + (a * 9999 + b * 999 + c * 99 + d * 9)

    因为 a * 9999 + b * 999 + c * 99 + d * 9 一定可以被9整除，因此num模除9的结果与 a + b + c + d + e 模除9的结果是一样的。

    对数字 a + b + c + d + e 反复执行同类操作，最后的结果就是一个 1-9 的数字加上一串数字，最左边的数字是 1-9 之间的，右侧的数字永远都是可以被9整除的。

    这道题最后的目标，就是不断将各位相加，相加到最后，当结果小于10时返回。因为最后结果在1-9之间，得到9之后将不会再对各位进行相加，因此不会出现结果为0的情况。因为 (x + y) % z = (x % z + y % z) % z，又因为 x % z % z = x % z，因此结果为 (num - 1) % 9 + 1，只模除9一次，并将模除后的结果加一返回。
        """
        def forAddDigists(n):
            s = 0
            while n > 0:
                s += (n%10)
                n //= 10
            if s > 10:
                s = forAddDigists(s)

            return s

        def forAddDigistsO1(n):

        return forAddDigists(num)


if __name__ == '__main__':
    s = Solution()
    print(s.addDigits(38))
