#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。

你可以假设除了整数 0 之外，这个整数不会以零开头。

示例 1:

输入: [1,2,3]
输出: [1,2,4]
解释: 输入数组表示数字 123。
示例 2:

输入: [4,3,2,1]
输出: [4,3,2,2]
解释: 输入数组表示数字 4321。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/plus-one
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""

class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        l = len(digits)
        lastVal = 1
        i = 1
        while i <= l:
            c = lastVal + digits[-i]
            if c > 9:
                lastVal = c // 10
                digits[-i] = c % 10
            else:
                digits[-i] = c
                lastVal = 0
            i += 1
        if lastVal:
           digits = [1]+digits

        return digits  

class Solution1(object):
    def plusOne(self, digits):
        return map(int, str(int(''.join(map(str,digits))) + 1)) 


class Solution2(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        length = len(digits)
        for i in range(length-1,-1,-1):
            digits[i] += 1
            if digits[i] == 10:
                digits[i] = 0
                if i==0:
                    digits.insert(0,1)
                    return digits
            else:
                return digits


if __name__ == '__main__':
    s = Solution()
    print(str(s.plusOne([1,2,3])))
    print(str(s.plusOne([1,2,9])))
    print(str(s.plusOne([9,9,9])))




      
