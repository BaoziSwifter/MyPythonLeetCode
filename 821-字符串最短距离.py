#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/6 18:22
# @Author  : Beliefei
# @File    : 字符串最短距离.py
# @Software: PyCharm

"""
给定一个字符串 S 和一个字符 C。返回一个代表字符串 S 中每个字符到字符串 S 中的字符 C 的最短距离的数组。

示例 1:

输入: S = "loveleetcode", C = 'e'
输出: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
说明:

字符串 S 的长度范围为 [1, 10000]。
C 是一个单字符，且保证是字符串 S 里的字符。
S 和 C 中的所有字母均为小写字母。
"""

class Solution(object):
    def shortestToChar(self, S, C):
        """
        :type S: str
        :type C: str
        :rtype: List[int]
        """
"""
        record = []
        res = []
        for i in range(0,len(S),1):
            if S[i] == C:
                record.append(i)
        for i in range(0,record[0],1):
            res.append(record[0] - i)
        res.append(0)
        for i in range(0,len(record) - 1,1):
            mid = (record[i+1] + record[i]) // 2
            for j in range(record[i] + 1,mid + 1,1):
                res.append(j - record[i])
            for j in range(mid + 1,record[i+1],1):
                res.append(record[i+1] - j)
            res.append(0)
        for i in range(record[len(record) - 1] + 1,len(S),1):
            res.append(i -record[len(record) - 1])
        return res
"""
        """
        pos = []
        for i,v in enumerate(S):
            if v == C:
                pos.append(i)

        result = []
        begin = -20000
        next = pos.pop(0)
        for i in range(len(S)):
            if i > next:
                begin = next
                next = len(pos) and pos.pop(0) or 20000

            result.append(min(i - begin, next-i))

        return result
        """
        def searchNearestIndex(string,index,r):
            a = string[index]
            if a == r:
                return 0
            else:
                left_current = 0
                leftFlag = 0
                leftString = string[:index]
                for i in range(len(leftString)):
                    if leftString[len(leftString)-i-1] == r:
                        left_current = len(leftString)-i-1
                        leftFlag = 1
                        break
                right_current = 0
                rightFlag = 0
                if index<len(string)-1:
                    rightString = string[index+1:]
                    for i in range(len(rightString)):
                        if rightString[i] == r:
                            right_current = i+len(leftString)+1
                            rightFlag = 1
                            break
                print("left String "+leftString)
                print("right String " + rightString)
                print("r is "+ r +", current string "+string[index]+", current index "+ str(index) +", leftIndex "+str(left_current)+", rightIndex "+str(right_current))
                if leftFlag and rightFlag:
                    return min(abs(left_current-index),abs(right_current-index))
                elif leftFlag:
                    return abs(left_current-index)
                else:
                    return abs(right_current-index)

        return [searchNearestIndex(S,i,C) for i in range(len(S))]


        #return [abs(ord(S[i])-ord(C)) for i in range(len(S))]

if __name__ == '__main__':
    s = Solution()
    print(s.shortestToChar("loveleetcode",'e'))
