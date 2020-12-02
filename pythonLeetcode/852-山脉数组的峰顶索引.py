#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/4 15:14
# @Author  : Beliefei
# @File    : 山脉数组的峰顶索引.py
# @Software: PyCharm

"""
我们把符合下列属性的数组 A 称作山脉：

A.length >= 3
存在 0 < i < A.length - 1 使得A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
给定一个确定为山脉的数组，返回任何满足 A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1] 的 i 的值。



示例 1：

输入：[0,1,0]
输出：1
示例 2：

输入：[0,2,1,0]
输出：1


提示：

3 <= A.length <= 10000
0 <= A[i] <= 10^6
A 是如上定义的山脉

"""

class Solution:
    def peakIndexInMountainArray(self, A):
        """
        :type A: List[int]
        :rtype: int
        """
        """
        return A.index(max(A))
        """
        """
        t = max(A)
        return A.index(t)
        """
        """
        def find(A,left,right):
            x = int((left + right) / 2)
            if A[x] > A[x - 1] and A[x] > A[x + 1]:
                return x
            if A[x] < A[x - 1]:
                return find(A,left,x)
            if A[x] < A[x + 1]:
                return find(A,x,right)
        return find(A,0,len(A)-1)
        """
        i = 0
        while i < len(A)-1:
            print(i)
            if A[i] < A[i+1] and A[i+1] > A[i+2]:
                return i+1
            i+=1


if __name__ == '__main__':
    s = Solution()
    index = s.peakIndexInMountainArray([3,4,5,1])
    print(index)




