#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/4 17:57
# @Author  : Beliefei
# @File    : 数字补全.py
# @Software: PyCharm

"""
给定一个正整数，输出它的补数。补数是对该数的二进制表示取反。

注意:

给定的整数保证在32位带符号整数的范围内。
你可以假定二进制数不包含前导零位。
示例 1:

输入: 5
输出: 2
解释: 5的二进制表示为101（没有前导零位），其补数为010。所以你需要输出2。
示例 2:

输入: 1
输出: 0
解释: 1的二进制表示为1（没有前导零位），其补数为0。所以你需要输出0。
"""

class Solution:
    def findComplement(self, num):
        """
        :type num: int
        :r
        """

        """
         return int('0b' + ''.join(list(map(lambda c:str(int(c)^1), str(bin(num)).replace('0b','')))),2)
        """

        """
        l = len(bin(num)[2:])
        s1 = '1'*l
        n = str(int(s1)-int(bin(num)[2:]))
        return int(n,2)
        """

        a = str(bin(num))
        s = 0;
        for i in a[2:]:
            print(i)
            if i == '0':
                s+=1
            s*=2
        s //= 2

        return s



if __name__ == '__main__':
    s = Solution()
    a = s.findComplement(5)
    print("*"*50)
    print(a)

